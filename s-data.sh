#!/bin/bash
sudo apt-get -y update
sudo apt-get -y install httpd
sudo apt-get -y install apache2
myip="curl http://169.254.169.254/latest/meta-data/local-ipv4"

cat << E0F > var/www/html/index.html
<html>

<h2> Power by <font color="DarkOrchid"> terraform

</html>
E0F
sudo service httpd start
chkcofig httpd on
