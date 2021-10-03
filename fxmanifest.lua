fx_version 'bodacious'
game 'gta5'

author 'Custard'
description 'Fueling system utilising qb-target'
version '1.0'

shared_scripts { 
	'config.lua'
}

client_scripts {
	'clientfunctions.lua',
	'client.lua'
}

server_scripts {
	'server.lua'
}

dependencies {
	'qb-core',
	'qb-target'
}

exports {
	'GetFuel',
	'SetFuel'
}
