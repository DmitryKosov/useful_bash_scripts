#!/bin/bash

set -o nounset

if [ $# -eq 0 ];then
	echo "Pass your comment as argument"
	exit
fi

if [ $# -eq 1 ];then
	git add .
	git commit -m "$1"
	git push
elif [ $# -ge 2 ];then
	for i in "$@";do
		if [ $i -eq $1 ];then
			continue
		else
			printf "$i"
			git add "$i"
		fi
	done
	git commit -m "$1"
	git push
fi
exit



