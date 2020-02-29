#!/bin/bash

for down_url in `cat url_list`
do
	dir_name=`echo $down_url | awk -F 'PPD/' '{print $2}'`
	dir_name=`echo ${dir_name/'/'/'-'}`

	if [ ! -d $dir_name ]
	then
		mkdir $dir_name
		echo $dir_name
	fi

	echo $dir_name
	for ppd in `cat $dir_name.list`
	do
	        echo $ppd 
		wget $down_url/$ppd
		mv $ppd $dir_name
	done
done
