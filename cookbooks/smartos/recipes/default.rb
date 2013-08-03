#
# Cookbook Name:: SmartOS
# Recipe:: default
#
# Copyright 2012, Joyent, Inc.
#
# All rights reserved - Do Not Redistribute
#

## Explicitly allow restart of  name service cache after
## updating resolv.conf
##
service "name-service-cache" do
 supports :enable => true, :start => true, :stop => true, :restart => true
 action [ :enable, :start ]
end


## Enable DNS
##
template "/etc/nsswitch.conf" do
 source "nsswitch.conf.erb"
 owner "root"
 group "sys"
 mode '0644'
 not_if "cat /etc/nsswitch.conf | grep ^hosts: | grep \" dns\""
 notifies :restart, resources(:service => "name-service-cache"), :immediate
end

## DNS Resolver
##
template "/etc/resolv.conf" do
 source "resolv.conf.erb"
 owner "root"
 group "sys"
 mode "0644"
 notifies :restart, resources(:service => "name-service-cache"), :immediate
end

## Set the Hostname
##
nodename = Chef::Config[:node_name]
execute "Set hostname to #{nodename}" do
  command "/usr/bin/hostname #{nodename} && /usr/bin/hostname > /etc/nodename"
  not_if "grep #{nodename} /etc/nodename"
end


## Enable atime on /var, so that WTMPX and logs work properly
##
execute "Enable atime for /var" do
  command "/usr/sbin/zfs set atime=on zones/var"
  only_if "/usr/sbin/zfs get -Hp atime zones/var | grep off"
end

##  Setup SSH for the Root User
##
if node.attribute?("ssh")
  include_recipe "smartos::ssh"
end

## Install 'nicstat'/'iozone'
##
include_recipe "smartos::nicstat"
include_recipe "smartos::iozone"

## Install 'pkgin'
include_recipe "smartos::pkgin"

#include_recipe "smartos::dtrace_scripts"


## Configure NTP
##
include_recipe "smartos::ntp"


#include_recipe "smartos::graphite"

## Write the motd
##
# include_recipe "smartos::motd"
