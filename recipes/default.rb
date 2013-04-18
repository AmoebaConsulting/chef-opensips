#
# Cookbook Name:: opensips
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

case node['opensips']['install_method']
when 'source'
  include_recipe 'opensips::source'
when 'package'
  include_recipe 'opensips::rtpproxy'
  package node['opensips']['package_name']
end

service 'opensips' do
  supports :status => true, :restart => true, :reload => true
  action :enable
end

service 'opensips' do
  supports :status => true, :restart => true, :reload => true
  action :start
end