#!/usr/bin/env sh

############################################################
# Symlink Data
############################################################

/server/ts3server_startscript.sh start inifile=ts3server.ini
/server/ts3server_startscript.sh stop
mv -n /server/ts3server.sqlitedb /data/ts3server.sqlitedb
rm /server/ts3server.sqlitedb
ln -s /data/ts3server.sqlitedb /server/ts3server.sqlitedb

############################################################
# Run
############################################################

/server/ts3server_minimal_runscript.sh inifile=ts3server.ini
