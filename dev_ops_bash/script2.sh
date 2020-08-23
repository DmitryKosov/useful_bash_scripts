#!/bin/bash
#Dmitry Kosov 2020-03-16

set -o nounset

#Uppgift 2
#Utgå från skript1.sh i övning 1 och kopiera till skript2.sh
#Detta skript ska byta IP adresser baserat på namn
#T.ex 192.168.10.2	host1
#Ange filnamn att söka i som arg1 ($1) (t.ex. hosts)
#Ange hostnamn som arg2 ($2)
#Ange ny ip adress som arg3 ($3)
#Kontrollera att du fått tre argument
#Kontrollera att filen finns
#Sök efter hostnamn, om träff byt ut ip adressen
#Skriv ut ändrad adress till STDOUT
#T.ex ./


if [ ${DEBUG} -eq 1 ]; then	
set -x
fi

if [ $# -ne 3 ]; then
	echo "Type 3 arguments: file, hostname, IP"
	exit
fi

if [ ! -e "$1" ]; then
	echo "File not found"
	exit
fi       
	
sed "/$2/ s/.*/$3\t$2/" $1 > tmp/newip

exit
