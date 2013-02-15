pkgin_binary = '/opt/pkg/bin/pkgin'

remote_file '/pkgin-bootstrap.tar.gz' do
	source 'http://192.168.3.114:8080/smartos/bootstrap-2012Q4-illumos.tar.gz'
	mode 0755
	owner "root"
	group "root"
	not_if { ::File.exists?(pkgin_binary) }
end

cookbook_file '/root/.profile' do
	source '.profile'
end

execute 'untar' do
	cwd '/'
	command '/usr/bin/gtar -zxf pkgin-bootstrap.tar.gz'
	creates pkgin_binary
end


file '/pkgin-bootstrap.tar.gz' do
 	action :delete
end

execute 'update-pkgin' do
	cwd '/'
	command 'pkgin -y up'
	only_if { ::File.exists?(pkgin_binary) }
end
