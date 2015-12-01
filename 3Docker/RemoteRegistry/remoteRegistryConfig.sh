#!/bin/bash
CURRENT_DIR=`pwd`

#Export the domain certificate()

# test.wso2.com is the domain name for registry
#copy domain file
sudo cp test.wso2.com /usr/local/share/ca-certificates/test.wso2.com.crt
sudo cp test.wso2.com /etc/ssl/certs/test.wso2.com.crt

# update certificcates
sudo update-ca-certificates

#update docker file
cd /etc/default
sudo sed -i '$ a DOCKER_OPTS="--insecure-registry test.wso2.com:5000"' docker

#restart the docker service
sudo service docker stop
sudo service docker start

# add host entry to domain
cd /etc
sudo sed -i '$ a 192.168.16.2 test.wso2.com' hosts
echo 'Updated the host entry'
