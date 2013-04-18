include_recipe 'build-essential'
include_recipe 'opensips::rtpproxy'

package 'mysql-libs'
package 'mysql-devel'

nginx_url = node['opensips']['source']['url']
basename = ::File.basename(nginx_url)
src_filepath = File.join((Chef::Config['file_cache_path'] || '/tmp'), basename)

directory ::File.dirname(src_filepath) do
  action :create
end

remote_file src_filepath do
  source nginx_url
  backup false
end

bash "compile_opensips_source" do
  cwd ::File.dirname(src_filepath)
  code <<-EOH
tar -zxf #{basename}
cd #{basename.gsub('_src', '-tls').gsub('.tar.gz', '')} &&
make include_modules="#{node['opensips']['source']['include_modules'].join(' ')}" prefix="#{node['opensips']['prefix']}" all &&
make include_modules="#{node['opensips']['source']['include_modules'].join(' ')}" prefix="#{node['opensips']['prefix']}" install
EOH
end

group "opensips" do
  group_name "opensips"
  action :create
end

user "opensips" do
  comment "opensips"
  username "opensips"
  gid "opensips"
  system true
  shell "/bin/false"
end

template '/etc/init.d/opensips' do
  source "opensips.init.erb"
  owner "root"
  group "root"
  mode 00755
end

service 'opensips' do
  supports :status => true, :restart => true, :reload => true
  action :enable
end

service 'opensips' do
  supports :status => true, :restart => true, :reload => true
  action :start
end