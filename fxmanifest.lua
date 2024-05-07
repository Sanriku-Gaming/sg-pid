fx_version 'cerulean'
game 'gta5'

name 'SG PID'
author 'Nicky'
description 'A simple Player ID Hud'
version '1.0.0'
lua54 'yes'

shared_script {
	"@ox_lib/init.lua",
}

client_scripts {
	'client/*'
}

files {
	'html/*.**',
}

ui_page 'html/index.html'
