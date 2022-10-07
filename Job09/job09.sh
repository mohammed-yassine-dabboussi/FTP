#!/bin/bash

# Donner les droits Sudo 
If 
sudo usermod -a -G sudo 'user'

#!/bin/bash
cd ~/Bureau/shell-exe/job9
cat home/yassine/Bureau/shell-exe/job9/Shell_Userlist.csv | while read varligne
do
	password=`echo $varligne |cut -d ',' -f4`
	username=`echo $varligne | cut -d ',' -f2`
	username=`echo ${username,,}`
	role=`echo $varligne |cut -d ',' -f5` 
	echo $role
	if [ ${role:0:5} = "Admin" ]
	then
		echo "creation de l'utilisateur : $username"
		sudo adduser -m -$username -p $password
		echo "changement de rôle de : $username"
		sudo usermod -aG sudo $username
	else
		echo "creation de l'utilisateur : $username"
		sudo adduser -m $username -p $password
	fi		
done < <(tail -n +2 Shell_Userlist.csv)
