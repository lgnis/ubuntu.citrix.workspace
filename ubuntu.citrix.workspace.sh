#!/bin/sh
#Instala la aplicación Citrix Workspace para Linux en Ubuntu/Debian
#Descarga el cliente desde https://www.citrix.com/en-au/downloads/workspace-app/linux/workspace-app-for-linux-latest.html

#Descarga el certificado
openssl s_client -showcerts -connect ev.seg-social.es:443 </dev/null 2>/dev/null|openssl x509 -outform PEM >seg-social-es.cer
sudo chmod 644 seg-social-es.cer 
sudo mv seg-social-es.cer /etc/ssl/certs
cd ..
cd Downloads/
sudo apt-get install ./icaclient_20.9.0.15_amd64.deb 
cd /opt/Citrix/ICAClient/keystore/
sudo rm -rf cacerts
sudo ln -s /etc/ssl/certs cacerts
cd ..
cd util
./ctx_rehash 
./configmgr &
