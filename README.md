OpenSIPS Cookbook
=================

Requirements
------------

#### operating systems
- `ubuntu` (init.d script only supports ubuntu right now)

#### packages
(I don't think any of these are required anymore)
- `ntpproxy` - opensips needs ntpproxy
- postgres db dev package

Attributes
----------

#### opensips::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>node['opensips']['prefix']</tt></td>
    <td>String</td>
    <td>where to install to</td>
    <td><tt>/</tt></td>
  </tr>
  <tr>
    <td><tt>node['opensips']['config_file']</tt></td>
    <td>String</td>
    <td>configuration</td>
    <td><tt>/etc/opensips/opensips.cfg</tt></td>
  </tr>
  <tr>
    <td><tt>node['opensips']['package_name']</tt></td>
    <td>String</td>
    <td>System package name</td>
    <td><tt>opensips</tt></td>
  </tr>
  <tr>
    <td><tt>node['opensips']['source']['url']</tt></td>
    <td>String</td>
    <td>where to get the source from</td>
    <td><tt>http://opensips.org/pub/opensips/latest/src/opensips-1.9.0_src.tar.gz</tt></td>
  </tr>
  <tr>
    <td><tt>node['opensips']['source']['include_modules']</tt></td>
    <td>Array</td>
    <td>which modules to include in complitation</td>
    <td><tt>["signaling,", "sl,", "tm,", "rr,", "dialog,", "maxfwd,", "usrloc,", "registrar,", "textops,", "sipmsgops,", "mi_fifo,", "uri,", "auth,", "auth_db,", "nathelper,", "alias_db,", "group,", "rtpproxy,", "enum,", "avpops,", "pike,", "domain"]</tt></td>
  </tr>
</table>

#### opensips::federate
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>node['opensips']['federate']['config']['debug_level']</tt></td>
    <td>Integer</td>
    <td>debug log level</td>
    <td><tt>3</tt></td>
  </tr>
  <tr>
    <td><tt>node['opensips']['federate']['config']['log_facility']</tt></td>
    <td>String</td>
    <td></td>
    <td><tt>LOG_LOCAL6</tt></td>
  </tr>
  <tr>
    <td><tt>node['opensips']['federate']['config']['listen_ip']</tt></td>
    <td>String</td>
    <td>the ip for opensips to listen on</td>
    <td><tt>localhost</tt></td>
  </tr>
  <tr>
    <td><tt>node['opensips']['federate']['config']['module_path']</tt></td>
    <td>String</td>
    <td>the path to opensips modules</td>
    <td><tt>/usr/lib64/opensips/modules</tt></td>
  </tr>
  <tr>
    <td><tt>node['opensips']['federate']['config']['user']</tt></td>
    <td>String</td>
    <td>user to run opensips as</td>
    <td><tt>opensips</tt></td>
  </tr>
  <tr>
    <td><tt>node['opensips']['federate']['config']['group']</tt></td>
    <td>String</td>
    <td>group to run opensips as</td>
    <td><tt>opensips</tt></td>
  </tr>
  <tr>
    <td><tt>node['opensips']['federate']['config']['db_uri']</tt></td>
    <td>String</td>
    <td>database uri for opensips</td>
    <td><tt>mysql://root:somepass@localhost/proxy</tt></td>
  </tr>
</table>

Usage
-----
#### opensips::default

Just include `opensips` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[opensips]"
  ]
}
```

#### opensips::rtpproxy

Just include `opensips::rtpproxy` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[opensips]",
    "recipe[opensips::rtpproxy]"
  ]
}
```

#### opensips::federate

Just include `opensips::federate` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[opensips]",
    "recipe[opensips::rtpproxy]",
    "recipe[opensips::federate]"
  ]
}
```