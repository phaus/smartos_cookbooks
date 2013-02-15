directory '/opt/local' do
	owner "root"
	group "root"
	mode 0644
	action :create
end

remote_file '/opt/local/dtbook_scripts.tar.gz' do
	source "#{node[:chef_source][:url]}/smartos/dtbook_scripts.tar.gz"
	mode 0755
	owner "root"
	group "root"
	not_if { ::File.exists?('/opt/local/dtbook_scripts.tar.gz') }
end

execute 'untar-dtbook_scripts' do
	cwd '/opt/local'
	command '/usr/bin/gtar -zxf dtbook_scripts.tar.gz'
	creates '/opt/local/dtbook_scripts/README'
end

remote_file '/opt/local/DTraceToolkit-0.99.tar.gz' do
	source "#{node[:chef_source][:url]}/smartos/DTraceToolkit-0.99.tar.gz"
	mode 0755
	owner "root"
	group "root"
	not_if { ::File.exists?('/opt/local/DTraceToolkit-0.99/README') }
end

file '/opt/local/DTraceToolkit-0.99.tar.gz' do
	action :delete
end

file '/opt/local/dtbook_scripts.tar.gz' do
	action :delete
end

execute 'untar-dtrace-toolkit' do
	cwd '/opt/local'
	command '/usr/bin/gtar -zxf DTraceToolkit-0.99.tar.gz'
	creates '/opt/local/DTraceToolkit-0.99/README'
end