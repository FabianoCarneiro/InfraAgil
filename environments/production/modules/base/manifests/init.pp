class base{
	case $::osfamily{
		"redhat":{
			$pacotes = ["fish", "epel-release","git","vim","sysstat","htop","sl","figlet"]
			$service = ["httpd"]
			
		}

		"debian":{
			$pacotes = ["fish", "git","vim","sysstat","cowsay","sl","figlet"]
			
			exec{"Atualiza repos":
				command => "/usr/bin/apt update"
			}
			
			$service = ["apache2"]
		}

	}

	package{$pacotes:
		ensure => present
	}

	service{"nginx":
		ensure => stopped, 
		enable => false
	}	

	service{$service:
		ensure => running,
		enable => true
	}

	file{'/root/.bashrc':	
		source => "puppet:///modules/base/bashrc_base",
		ensure => present
	}

	user{'devops':
		ensure => present,
		managehome => yes,
		shell => "/usr/bin/fish"
	}
}
