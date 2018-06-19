node "default" {
	include config
	
}

node /(devops|automation).salas4linux.com.br/ {	
	include base
	include config
}

node docker.salas4liux.com.br{
	include docker
}
