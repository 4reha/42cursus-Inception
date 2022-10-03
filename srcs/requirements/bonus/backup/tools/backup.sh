#!/bin/sh

while true;
do
	echo "Backup time!!"
	time=$(date '+%Y-%m-%d %H:%M:%S')
	
	backup_folder="backup_${time}"
	mkdir "/backup/$backup_folder"

	echo "backup mariadb server at $time in $backup_folder"
	cp -Rf /data/db/* /backup/"${backup_folder}"
	
	sleep 5m
done

exit 0