node 'slave'{
$service_enable = 'true'
class {'testhttpd':
package => 'httpd',
package_ensure => 'present',
config_file => '/etc/httpd/conf/httpd.conf',
file_ensure => 'file',
file_source => 'puppet:///modules/testhttpd/httpd.conf',
service => 'httpd',
service_ensure => 'running',
# service_enable => 'true',

# 	include test
}
}
