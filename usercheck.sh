#!/bin/bash

#Check if user exists

set -o nounset

echo "in passwd"
grep $1 /etc/passwd
echo "in group"
grep $1 /etc/group

exit
