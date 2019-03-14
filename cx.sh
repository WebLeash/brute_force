#!/bin/bash

set -x

# sudo apt-get install gnumeric

xls_file=$1
csv_file=$2
if [ "$1" = "" ] ; then
	echo "Please enter a xls_file"
	exit 0
fi

if [ "$2" = "" ] ;  then
	echo "Please enter a csv_file"
	exit 0
fi
if [ -f temp.csv ]; then
	rm temp.csv
fi
ssconvert $1 temp.csv

found=0;
cat temp.csv |while read line
do

	echo "$line" |grep  'United Kingdom'
	if [ $? -eq 0 ]; then
		cp temp.csv $2
		exit 0;
	fi
done
if [ -f temp.csv ]; then
	rm temp.csv
fi
