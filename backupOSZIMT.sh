#!/bin/bash
#
# ==================================================
# Shell script zum Erstellen von Backups
# ==================================================
#
# Autoren: Rmayid, Schnack, Tuan
# Erstellt: 01/2021
#
# Features: 
#	- komfortable Flexibilität durch externe Konfigurationsdatei 
#	- 

wall='##################################################'
title='RDIFF-BACKUP-SCRIPT'

printf "\n$wall\n\t$title\n$wall\n"

# JSON einlesen
dirs=$(jq '.src[]' < config.json)
dest=$(eval printf `jq '.dst' < config.json`)

printf "Backup directory is: $dest"

for d in $dirs
do
	currentDir=$(eval printf '%s' $d)
	printf "\n\n###\nBacking up: /%s\n" $currentDir
	$(sudo rdiff-backup --force /$currentDir $dest/$currentDir)
	printf "\nDeleting older backups\n"
	sudo rdiff-backup --remove-older-than 4B $dest/$currentDir/
done
printf "\n\n\t~Fin~\n\n"
