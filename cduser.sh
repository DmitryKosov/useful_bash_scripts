#!/bin/bash

#Script to create and delete from a file users from Linux systems (it tests on Ubuntu 20.04)


set -o nounset


if [ $# -ne 2 ]; then
	echo "Type 2 arguments: filename, flag ( -c  create users, -d delete users ) "
	exit
fi

if [ ! -e "$1" ]; then
	echo "File not found"
	exit
fi
case $2 in

	-c)

		while IFS=, read -r col1 col2
		do
			exists=$(grep -c "^$col1:" /etc/passwd)
			if [ $exists -eq 0 ]; then
				pass=$(perl -e 'print crypt($ARGV[0], "password")' $col2)
				useradd -m -p "$pass" "$col1"
				echo "User $col1 added"
			else
				echo -e "$col2\n$col2"| passwd $col1
			fi
		done < $1
		;;
	-d)
		while IFS=, read -r col1 col2
		do
			userdel -r $col1
		done < $1
		;;
	*)
		echo "No flag specified"
		exit
		;;
esac

exit
