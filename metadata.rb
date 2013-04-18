name             'opensips'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures opensips'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe "opensips", "Installs opensips package and sets up configuration"
recipe "opensips::source", "Installs opensips from source and sets up configuration"
recipe "opensips::rtpproxy", "Installs and enables rtpproxy"
recipe "opensips::federate", "Installs the federate.io configuration"

%w{ centos redhat amazon scientific oracle fedora }.each do |os|
  supports os
end

%w{ build-essential yum }.each do |cb|
  depends cb
end