class testhttpd
(
$package = $testhttpd::params::package,
$package_ensure = $testhttpd::params::package_ensure,
$config_file = $testhttpd::params::config_file,
$file_ensure = $testhttpd::params::file_ensure,
$file_source = $testhttpd::params::file_source,
$service = $testhttpd::params::service,
$service_ensure = $testhttpd::params::service_ensure,
# $service_enable =  $testhttpd::params::service_enable,
)
inherits testhttpd::params
{
case $::osfamily {
	'Redhat': {
	package {$package:
		ensure => $package_ensure,	
		}
	file 	{$config_file:
		ensure => $file_ensure,
		source => $file_source,
		require => Package[$package],
		}
	service {$service:
		ensure => $service_ensure,
		enable => $service_enable,
		subscribe => File[$config_file],
		}	
	}
	'Debian': {
	package {"apache2":
		ensure => present,
		}
	file 	{"/etc/appache2/apache2.conf":
		ensure => 'file',
		source => "puppet:///modules/testhttpd/httpd.conf",
		mode => '0644',
		}
	service {'apache2':
		ensure => 'running',
		enable => 'true',
		}
	}
	default: {
	package { 'tree':
		ensure => 'present',
		}
	file	{'/tmp/puppet.txt':
		ensure => file,
		source => "puppet:///modules/testhttpd/httpd.con"
		}
	}

}
}
