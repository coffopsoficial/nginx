#!/bin/bash
# Autor Eduardo Pereira
# https://github.com/eduardojpereira
# https://github.com/coffopsoficial/nginx

echo "#####################################"
echo "# Instalando pré-requisitos com APT #"
echo -e "####################################\n\n"

apt install -y  curl gnupg2 ca-certificates lsb-release ubuntu-keyring

echo -e "\n\n"
echo "###################################################"
echo "# Importando chave de assinatura oficial do nginx #"
echo -e "##################################################\n\n"

curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null

echo -e "\n\n"
echo "############################################################"
echo "# Verificando se o arquivo baixado contém a chave adequada #"
echo -e "###########################################################\n\n"

mkdir /root/.gnupg/
gpg --dry-run --quiet --import --import-options import-show /usr/share/keyrings/nginx-archive-keyring.gpg

echo -e "\n\n"
echo "##################################"
echo "# Adicionando Repositório Stable #"
echo -e "##################################\n\n"

echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" | sudo tee /etc/apt/sources.list.d/nginx.list


echo -e "\n\n"
echo "####################"
echo "# Instalando Nginx #"
echo -e "####################\n\n"

apt update
apt install nginx

echo -e "\n\n"
echo "###############"
echo "# Finalizando #"
echo -e "###############\n\n"
