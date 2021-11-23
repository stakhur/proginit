#!/bin/bash

if [ $# -ne 1 ] ; then
	for s in `ls -1 src/*.pas` ; do $0 $s ; done
	exit 0
fi

inp=$1
name=`echo $inp | awk -F'src/' '{print $2}' | awk -F'.pas' '{print $1}'`
path=`echo $inp | awk -F'src/' '{print $1}'`

fpc $inp -FE${path}obj/.
mv ${path}obj/$name ${path}bin/.
