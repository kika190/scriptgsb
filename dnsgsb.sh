#!/bin/bash
apt update -y && apt upgrade -y
apt install bind9 -y

wget https://raw.githubusercontent.com/kika190/scriptgsb/main/named.conf.local
wget https://raw.githubusercontent.com/kika190/scriptgsb/main/db.gsb.lan
wget https://raw.githubusercontent.com/kika190/scriptgsb/main/db.gsb.lan.rev

cp named.conf.local /etc/bind
cp db.gsb.lan /etc/bind
cp db.gsb.lan.rev /etc/bind
rm -rf *
systemctl restart bind9
