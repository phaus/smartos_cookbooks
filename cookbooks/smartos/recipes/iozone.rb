directory "/opt/custom/bin" do
  owner "root" 
  group "root"
  mode '0755'
end

cookbook_file "/opt/custom/bin/iostat" do
  source "iozone"
  owner "root"
  group "root"
  mode "0755"
end
