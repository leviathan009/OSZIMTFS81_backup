#!/bin/bash

#JSON einlesen
dirs=$(jq '.src[]' < ~/config.json)

for d in $dirs
do
	echo "/$(eval printf '%s' $d)"
done
echo "~Fin~"
