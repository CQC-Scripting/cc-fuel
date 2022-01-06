fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'CQC Development'
description 'Fueling system utilising qb-target'
version '1.1'

shared_scripts { 
	'config.lua'
}

client_scripts {
	'client_functions.lua',
	'client_interactions.lua',
	'client.lua'
}

server_scripts {
	'server.lua'
}

dependencies {
	'qb-core'
}

exports {
	'GetFuel',
	'SetFuel',
	'IsSiphonFuelAllowed',
	'IsPetrolCanRefuelAllowed',
	'CanPumpRefuelPetrolCan',
}
