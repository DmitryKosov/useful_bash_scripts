#!/bin/bash
#Dmitry Kosov 2020-03-16

set -o nounset

#Uppgift 1
#Skapa ett skript (skript1.sh) i katalogen dev_ops_bash
#Skriptet ska öppna filerna i ./tmp - en efter en - och läsa dem rad för rad
#Skriptet ska leta efter IP adress med formatet 192.168.10.???
#192.168.10 motsvarar nätdelen av adressen
#Om den adressen hittas ska den bytas ut mot 192.168.20.???
#Skriv till en kopia av originalfilen. Döp den till samma namn men .upd på slutet


if [ ${DEBUG} -eq 1 ]; then	
set -x
fi
pattern="192.168.10"
new_pattern="192.168.20"
for file in ./tmp/*
do
	if [[ ${file} != *".upd" ]]; then
		grep $pattern $file && cp $file $file.upd	
		sed -i "s/${pattern}/${new_pattern}/" ${file}
	fi
done
exit
