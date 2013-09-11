default['opensips']['prefix'] = '/usr'

default['opensips']['source']['url'] = "http://opensips.org/pub/opensips/latest/src/opensips-1.9.1-svn10242_src.tar.gz"
default['opensips']['source']['include_modules'] = ["signaling,", "sl,", "tm,", "rr,", "dialog,", "maxfwd,", "usrloc,", "registrar,", "textops,", "sipmsgops,", "mi_fifo,", "uri,", "auth,", "auth_db,", "nathelper,", "alias_db,", "group,", "rtpproxy,", "enum,", "avpops,", "pike,", "domain"]

# Memory options (inserted into /etc/default) for shared memory (s) and package memory (p), in Mb
default['opensips']['s_memory'] = 64
default['opensips']['p_memory'] = 4

default['opensips']['config'] = {}

# This is probably ok to leave
default['opensips']['config']['debug_level'] = 3

# CHANGE THIS
default['opensips']['config']['listen_ip'] = 'localhost'

# CHANGE THIS to match your install prefix
if Chef::Extensions::Platform.x86_64?
  default['opensips']['config']['module_path'] = "#{node['opensips']['prefix']}/lib64/opensips/modules"
else
  default['opensips']['config']['module_path'] = "#{node['opensips']['prefix']}/lib/opensips/modules"
end