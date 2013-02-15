package 'py27-carbon' do
	version '0.9.10'
	action :install
end

package 'py27-graphite-web' do
	version '0.9.10'
	action :install
end

template "/opt/local/lib/python2.7/site-packages/graphite/local_settings.py" do
 source "local_settings.erb"
end

template "/opt/local/etc/graphite/storage-schemas.conf" do
 source "storage-schemas.erb"
end

template "/opt/local/etc/graphite/storage-aggregation.conf" do
 source "storage-aggregation.erb"
end

template "/opt/local/etc/graphite/carbon.conf" do
 source "carbon.erb"
end