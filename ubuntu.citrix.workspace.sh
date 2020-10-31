#!/bin/sh
#Instala la aplicación Citrix Workspace para distribuciones Linux basadas en Ubuntu/Debian
cd
cd Descargas
#Descarga el cliente desde https://www.citrix.com/es-es/downloads/workspace-app/linux/workspace-app-for-linux-latest.html
#Seleccionar Debian packages -> Full packages -> .deb para (32bit)=x86 o para (64bit)=x86_64
#Dejar el archivo descargado en Downloads
#Descarga el certificado
openssl s_client -showcerts -connect ev.seg-social.es:443 </dev/null 2>/dev/null|openssl x509 -outform PEM >ev-seg-social-es.cer
#Cambia los permisos del certificado
sudo chmod 644 ev-seg-social-es.cer 
#Movemos el certificado a /etc/ssl/certs
sudo mv oviedo-es.cer /etc/ssl/certs
#Cambiar al directorio donde se ha descargado la aplicación de Citrix Workspace para Linux
#Instalamos la aplicación Citrix Workspace para Linux
sudo apt-get install ./icaclient_20.9.0.15_amd64.deb 
#Cambiar al directorio donde estań los certificados
cd /opt/Citrix/ICAClient/keystore/
#Borramos los certificados que instala Citrix por defecto
sudo rm -rf cacerts
#Creamos un enlace simbólico a los certificados que tiene Ubuntu/Debian
sudo ln -s /etc/ssl/certs cacerts
cd ..
#Cambiamos al directorio Util de Citrix
cd util
#Hacemos un rehas a los certificados del directorio
sudo ./ctx_rehash 
#Entramos a la configuración de la aplicación Citrix
./configmgr &
#Aceptar la licencia y configurar la aplicación. Luego pulsar en "Guardar y cerrar"
