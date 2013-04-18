opensips_user = node['opensips']['federate']['config']['user']
opensips_group = node['opensips']['federate']['config']['group']

group opensips_group do
  group_name opensips_group
  action :create
end

user opensips_user do
  comment "opensips user"
  username opensips_user
  gid opensips_group
  system true
  shell "/bin/false"
end

template node['opensips']['config_file'] do
  source "federate/opensips.cfg.erb"
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