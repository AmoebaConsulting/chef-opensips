name             'opensips'
maintainer       'Amoeba Consulting'
maintainer_email 'sayhi@amoe.ba'
license          'MIT'
description      'Installs/Configures OpenSIPS for Ubuntu'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

recipe "opensips", "Installs opensips and sets up configuration"
recipe "opensips::rtpproxy", "Installs and enables rtpproxy"
recipe "opensips::federate", "Installs the federate.io configuration"

# Presently, the init.d script is ubuntu-specific. Will need to be revisited for other OSes
supports 'Ubuntu'