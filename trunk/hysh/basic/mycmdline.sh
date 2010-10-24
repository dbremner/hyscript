#!/bin/bash
# Author: Hu
# Date: 2.26.2007
# Purpose: Test root authority

ROOT_UID=0
LINES=50 	#

E_NOTROOT=67


#
if [ "$UID" -ne "$ROOT_UID" ] 
then
	echo "Must be root to run the script"
	exit $E_NOTROOT
fi

### method one
if [ -n "$1" ]
then
	lines=$1
else
	lines=$LINES #
fi

echo $lines

### method two
E_WRONGARGS=65 #

case "$2" in
 ""      ) lines=50;;
 *[!0-9]*) echo "Usage: `basename $0` file-to-cleanup"; exit $E_WRONGARGS;;
 *        ) lines=$2;;
 esac

echo $lines
