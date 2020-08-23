#!/bin/bash

set -o nounset

#Uppgift 3
#Utgå från skript2.sh i övning 1 och kopiera till skript3.sh
#Lägg till följande kontroll
#Arg1 $1 kan ha följande värden
#-s för sök	Sök efter IP-adress eller hostnamn. Skriv träff till STDOUT
#-b för byt 	Byt ut som i uppgift 2 skript2
#-r för radera	Sätt ett # i början på raden för att kommentera bort den
#Om inget angetts så skriv ut ett felmeddelande/instruktion och gör exit

#Skriv ut den uppdaterade filen till filnamn.upd3


if [ ${DEBUG} -eq 1 ]; then
set -x
fi

if [ $# -ne 4 ]; then
        echo "Type 4 arguments: flag, file, hostname, IP"
        exit
fi

if [ ! -e "$2" ]; then
	echo "File not found"
	exit
fi

case $1 in

	-s)
		grep -n $3 $2
		;;
	-b)
		sed "/$3/ s/.*/$4\t$3/" $2 > $2.upd3
		;;

	-r)
		sed "/$3/ s/.*/#&/" $2 > $2.upd3
		;;
	*)
		echo "No flag specified"
		exit
		;;
esac

exit

