#!/bin/bash

set -o nounset

if [ $# -ne 1 ];then
	echo "Pass filename as argument"
	exit
fi

touch $1
#echo \#/bin/bash>>$1
#echo set -o nounset>>$1
string1="#!/bin/bash"
string2="set -o nounset"
echo $string1 >> $1
echo $string2 >> $1
chmod u+x $1
