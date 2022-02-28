fx_version "cerulean"

games {"gta5"}

description "Custom Made Storage Unit System Made by Kalxie#0001"
version "1.0.0"

server_script '@iconic-remotecalls/server/sv_main.lua'
client_script '@iconic-remotecalls/client/cl_main.lua'


client_scripts {
    "client/*.lua"
}

server_scripts {
    "server/*.lua"
}

