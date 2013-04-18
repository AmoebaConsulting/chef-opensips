package 'rtpproxy'

service 'rtpproxy' do
  supports :status => true, :restart => true, :reload => true
  action :enable
end

service 'rtpproxy' do
  supports :status => true, :restart => true, :reload => true
  action :start
end