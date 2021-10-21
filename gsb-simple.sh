#!/bin/bash
apt update -y && apt upgrade -y
apt install apache2 libapache2-mod-php php-mysql -y
wget https://raw.githubusercontent.com/kika190/scriptgsb/main/gsb_frais.conf
wget https://github.com/kika190/scriptgsb/raw/main/gsb-simple.tar.gz
cp /root/gsb_frais.conf /etc/apache2/sites-available/
tar -xzvf gsb-simple.tar.gz
cp -r gsb /var/www
a2ensite gsb_frais.conf
a2dissite 000-default
systemctl restart apache2
