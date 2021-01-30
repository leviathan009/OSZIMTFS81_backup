#!/bin/bash
#==================================================
#Shell script zum Erstellen von Backups
#==================================================
#Autoren: Rmayid, Schnack, Tuan
#Erstellt: 01/2021
#
#Features: 
#	- komfortable Flexibilität durch externe Konfigurationsdatei 
#	- 
#JSON einlesen
dirs=$(jq '.src[]' < ~/config.json)

for d in $dirs
do
	echo "/$(eval printf '%s' $d)"
done
echo "~Fin~"
