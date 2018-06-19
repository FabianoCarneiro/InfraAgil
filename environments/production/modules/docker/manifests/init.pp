class xpto{
        case $::osfamily{
                "redhat":{
			$pacotes = ["yum-utils","device-mapper-persistent-data","lvm2"]

			exec{"criando REPO":
                		command => "/bin/yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo"
        		}		
                }

                "debian":{

			exec{"Atualizando repo":
				command => "/usr/bin/apt update"
			}
			$pacotes = ["apt-transport-https","ca-certificates","curl","software-properties-common"]
			
			exec{"criando REPO":
				command => "/usr/bin/curl -fsSL https://download.docker.com/linux/ubuntu/gpg | /usr/bin/apt-key add - ; /usr/bin/add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable'; /usr/bin/apt update"
			}
			
		}

	}
	package{$pacotes:
		ensure => present
	}
	
	package{'docker-ce':
		ensure => present
	}
	service{'docker':
		ensure => true,
		enabled => true,
		require => Package['docker-ce']
	}
}
