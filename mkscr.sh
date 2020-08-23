#!/bin/bash
#Creates bash scripts 
set -o nounset

if [ $# -ne 1 ];then
	echo "Pass filename as argument"
	exit
fi

touch $1

echo "#!/bin/bash" >> $1
echo "set -o nounset" >> $1
chmod u+x $1
