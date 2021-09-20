apt update -y && apt upgrade -y
apt install apache2 mysql-server libapache2-mod-php php-mysql -y
wget https://raw.githubusercontent.com/kika190/scriptgsb/main/gsb_frais_insert_tables_statiques.sql
wget https://raw.githubusercontent.com/kika190/scriptgsb/main/gsb_frais_structure.sql
wget https://raw.githubusercontent.com/kika190/scriptgsb/main/gsb_frais.conf
wget https://github.com/kika190/scriptgsb/raw/main/gsb.tar.gz
tar -xzvf gsb.tar.gz


mysql -u root -p 

CREATE DATABASE gsb_frais;
CREATE USER 'gsb'@'localhost' IDENTIFIED BY 'gsbpass';
GRANT ALL PRIVILEGES ON gsb_frais.* TO 'gsb'@'localhost';
flush privileges;
exit;


mysql -u root -p gsb_frais < /root/gsb_frais_structure.sql
mysql -u root -p gsb_frais < /root/gsb_frais_insert_tables_statiques.sql


cp /root/gsb /var/www
cp /root/gsb_frais.conf /etc/apache2/sites-available/


a2ensite gsb_frais.conf
a2dissite 000-default
