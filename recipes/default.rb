%w(openssl g++ gcc bison flex make perl libdbi-perl  libfrontier-rpc-perl libterm-readline-gnu-perl).each do |pkg|
  package pkg
end

opensips_url = node['opensips']['source']['url']
basename = ::File.basename(opensips_url)
src_filepath = File.join((Chef::Config['file_cache_path'] || '/tmp'), basename)

directory ::File.dirname(src_filepath) do
  action :create
end

remote_file src_filepath do
  source opensips_url
  backup false
end

bash "compile_opensips_source" do
  cwd ::File.dirname(src_filepath)
  code <<-EOH
tar -zxf #{basename}
cd #{basename.gsub(basename.match(/opensips-\d*\.\d*.\d*(.*?_src)/i)[1], '-tls').gsub('.tar.gz', '')} &&
make include_modules="#{node['opensips']['source']['include_modules'].join(' ')}" prefix="#{node['opensips']['prefix']}" all &&
make include_modules="#{node['opensips']['source']['include_modules'].join(' ')}" prefix="#{node['opensips']['prefix']}" install
EOH
  not_if do
    File.exist? node['opensips']['prefix']
  end
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

template '/etc/default/opensips' do
  source "opensips.default.erb"
  owner "root"
  group "root"
  mode 00644
end

template '/etc/init.d/opensips' do
  source "opensips.init.erb"
  owner "root"
  group "root"
  mode 00755
end

config_file = "#{node['opensips']['prefix']}/etc/opensips/opensips.cfg"

template config_file do
  source "opensips.cfg.erb"
  owner "root"
  group "root"
  mode 00600
  action :create
end

service 'opensips' do
  supports :status => true, :restart => true, :reload => true
  action :enable
end

service 'opensips' do
  supports :status => true, :restart => true, :reload => true
  action :start
end