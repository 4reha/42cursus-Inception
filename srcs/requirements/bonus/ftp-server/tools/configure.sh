if [ ! -f "/etc/vsftpd.conf.bak" ]; then

	mkdir -p /var/run/vsftpd/empty

	cp /etc/vsftpd.conf /etc/vsftpd.conf.bak
	mv /var/www/vsftpd.conf /etc/vsftpd.conf

	adduser $FTP_USR --disabled-password
	echo "$FTP_USR:$FTP_PWD" | /usr/sbin/chpasswd &> /dev/null
	chown -R $FTP_USR:$FTP_USR /var/www/html/wordpress

	echo $FTP_USR | tee -a /etc/vsftpd.userlist &> /dev/null

fi

echo "FTP started on :21"
/usr/sbin/vsftpd /etc/vsftpd.conf