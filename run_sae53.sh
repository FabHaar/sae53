#!/bin/bash

#Etape 1 Creation du réseau sae53 :
docker network create sae53

#Etape 2 : Création du conteneur mysql :
docker run --name SQL_Server \
	-p 3306:3306 \
	-v dolibarr_db:/var/lib/mysql \
	--env MYSQL_USER=php \
	--env MYSQL_PASSWORD=php \
	--env MYSQL_ROOT_PASSWORD=foo \
	--network=sae53 \
	-d mysql

#attente pour être sûr que le SGBD soit accessible
sleep 10

