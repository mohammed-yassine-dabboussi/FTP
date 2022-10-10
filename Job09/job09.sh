#!/bin/bash
cd /home/yassine/Bureau/ftp/Job09
sudo groupadd ftpadmin
sudo chmod 770 ftpadmin

cat /home/yassine/Bureau/ftp/liste.csv | while read varligne
do
	password=`echo $varligne |cut -d ',' -f4`
	username=`echo $varligne | cut -d ',' -f2`
	username=`echo ${username,,}`
	role=`echo $varligne |cut -d ',' -f5` 
	echo $role
	if [ $role = "Admin" ]
	then
		echo "Création de l'utilisateur : $username"
		pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
    		sudo useradd -m -p "$pass" "$username"
		echo "changement de rôle de : $username"
		sudo usermod -aG sudo $username
		sudo adduser $username ftpadmin
	else
		echo "creation de l'utilisateur : $username"
		pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
    		sudo useradd -m -p "$pass" "$username"
	fi		
done < <(tail -n +2 users.csv)
