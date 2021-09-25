apt update -y && apt upgrade -y

apt install apache2 mariadb-server libapache2-mod-php php-mysql -y

wget https://raw.githubusercontent.com/kika190/scriptgsb/main/gsb_frais_insert_tables_statiques.sql
wget https://raw.githubusercontent.com/kika190/scriptgsb/main/gsb_frais_structure.sql
wget https://raw.githubusercontent.com/kika190/scriptgsb/main/gsb_frais.conf
wget https://github.com/kika190/scriptgsb/raw/main/gsb.tar.gz


tar -xzvf gsb.tar.gz 



mysql -e "CREATE DATABASE gsb_frais;"
mysql -e "CREATE USER 'gsb'@'localhost' IDENTIFIED BY 'gsbpass';"
mysql -e "GRANT ALL PRIVILEGES ON gsb_frais.* TO 'gsb'@'localhost';"
mysql -e "flush privileges;"



mysql -u root gsb_frais < /root/gsb_frais_structure.sql
mysql -u root gsb_frais < /root/gsb_frais_insert_tables_statiques.sql


cp -r /root/gsb /var/www
cp /root/gsb_frais.conf /etc/apache2/sites-available/


a2ensite gsb_frais.conf
a2dissite 000-default
rm -rf *

systemctl restart apache2
                                                             .
