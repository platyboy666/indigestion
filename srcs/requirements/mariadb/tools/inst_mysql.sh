#!/bin/bash

# Utilisation de envsubst pour générer le fichier SQL
envsubst < /etc/mysql/init_var.sql > /etc/mysql/init.sql

mysql_install_db
mysqld
