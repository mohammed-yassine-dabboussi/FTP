#!/bin/bash
sudo apt-get install proftpd*
echo proftpd.txt > /etc/proftpd/proftpd.conf
echo tls.txt > /etc/proftpd/tls.conf
echo modules.txt > /etc/proftpd/modules.conf
sudo apt install filezilla
sudo apt-get install openssl
mkdir /etc/proftpd/ssl
sudo openssl req -new -x509 -days 365 -nodes -out /etc/proftpd/ssl/proftpd.cert.pem -keyout /etc/proftpd/ssl/proftpd.key.pem
sudo chmod 640 /etc/proftpd/ssl/proftpd.cert.pem
sudo chmod 600 /etc/proftpd/ssl/proftpd.key.pem
sudo service restart proftpd
