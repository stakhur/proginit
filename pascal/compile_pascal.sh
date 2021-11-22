#!/bin/bash

inp=$1
name=`echo $inp | awk -F'src/' '{print $2}' | awk -F'.pas' '{print $1}'`
echo 'NAME: ' $name
path=`echo $inp | awk -F'src/' '{print $1}'`
echo 'PATH: ' $path

fpc $inp -FE${path}obj/.
mv ${path}obj/$name ${path}bin/.
