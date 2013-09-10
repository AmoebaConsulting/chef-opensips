default['opensips']['prefix'] = '/usr'
default['opensips']['config_file'] = '/etc/opensips/opensips.cfg'
default['opensips']['package_name'] = "opensips"

default['opensips']['source']['url'] = "http://opensips.org/pub/opensips/latest/src/opensips-1.9.1-svn10242_src.tar.gz"
default['opensips']['source']['include_modules'] = ["signaling,", "sl,", "tm,", "rr,", "dialog,", "maxfwd,", "usrloc,", "registrar,", "textops,", "sipmsgops,", "mi_fifo,", "uri,", "auth,", "auth_db,", "nathelper,", "alias_db,", "group,", "rtpproxy,", "enum,", "avpops,", "pike,", "domain", "db_postgres"]

# Memory options (inserted into /etc/default) for shared memory (s) and package memory (p), in Mb
default['opensips']['s_memory'] = 64
default['opensips']['p_memory'] = 4

default['opensips']['federate'] = {}
default['opensips']['federate']['config'] = {}

# This is probably ok to leave
default['opensips']['federate']['config']['debug_level'] = 3

# CHANGE to whatever you have syslog set up to log
# for your proxy
default['opensips']['federate']['config']['log_facility'] = 'LOG_LOCAL6'

# CHANGE THIS
default['opensips']['federate']['config']['listen_ip'] = 'localhost'

# CHANGE THIS to match your install prefix
default['opensips']['federate']['config']['module_path'] = '/usr/lib64/opensips/modules'

# This user and group must exist
default['opensips']['federate']['config']['user'] = 'opensips'
default['opensips']['federate']['config']['group'] = 'opensips'

# We set db_url then reference it for all other db_urls
# since they share a common db.  You can set them individually.
#
# This is the format for a mysql db in opensips
#      dbtype   user pass     host      db
db_url = 'mysql://root:somepass@localhost/proxy'
default['opensips']['federate']['config']['db_url'] = db_url
default['opensips']['federate']['config']['group_db_url'] = db_url
default['opensips']['federate']['config']['alias_db_url'] = db_url
default['opensips']['federate']['config']['auth_db_url'] = db_url
default['opensips']['federate']['config']['avp_db_url'] = db_url
default['opensips']['federate']['config']['dialog_db_url'] = db_url
default['opensips']['federate']['config']['usrloc_db_url'] = db_url
default['opensips']['federate']['config']['domain_db_url'] = db_url