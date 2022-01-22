#!/bin/bash
# Autor Eduardo Pereira
# https://github.com/eduardojpereira
# https://github.com/coffopsoficial/nginx

echo "#####################################"
echo "# Instalando pré-requisitos com YUM #"
echo -e "####################################\n\n"

yum install -y yum-utils

echo -e "\n\n"
echo "###################################################"
echo "# Criando nginx.repo dentro de /etc/yum.repost.d  #"
echo -e "##################################################\n\n"

echo "[nginx-stable]
name=nginx stable repo
baseurl=http://nginx.org/packages/centos/\$releasever/\$basearch/
gpgcheck=1
enabled=1
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true

[nginx-mainline]
name=nginx mainline repo
baseurl=http://nginx.org/packages/mainline/centos/\$releasever/\$basearch/
gpgcheck=1
enabled=0
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true" > /etc/yum.repos.d/nginx.repo

echo -e "\n\n"
echo "####################"
echo "# Instalando Nginx #"
echo -e "####################\n\n"

yum install -y nginx

echo -e "\n\n"
echo "###############"
echo "# Finalizando #"
echo -e "###############\n\n"
