$instalar = ["vim", "htop"]
$remover = ["ccze","figlet"]

service{'cron':
	enable => true,
	ensure => running
}

file{'/tmp/memfree':
     source => "/root/memfree",
     ensure => present
}

package { $instalar:
       ensure => 'present'
}
package { $remover:
	ensure => 'absent'
}

exec{ "memoria_free":
      command => "/usr/bin/free -h > /root/memfree"
}

