class test{
$web = $::osfamily ? {
	'Debian' => 'apache2',
	default => 'httpd',
	}
$service = $::osfamily ? {
	'Debian' => 'apache2',
	default => 'httpd',
	}
package{'web':
	name => $web,
	ensure => 'present',
	}
file{'/etc/httpd/conf/httpd.conf':
	source => "puppet:///modules/test/httpd.conf",
	require => Package['web'],
	}
service{'web-service':
	name => $service,
	ensure => 'running',
	enable => 'true',
	subscribe => File['/etc/httpd/conf/httpd.con'],
	}
}

