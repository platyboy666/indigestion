#!/bin/bash
# Vérification des variables d'environnement nécessaires
: "${MYSQL_ROOT_PASSWORD:?Variable MYSQL_ROOT_PASSWORD non définie}"
: "${WP_DB_USER:?Variable WP_DB_USER non définie}"
: "${WP_DB_PASSWORD:?Variable WP_DB_PASSWORD non définie}"
: "${WP_DB_NAME:?Variable WP_DB_NAME non définie}"

# Utilisation de envsubst pour générer le fichier SQL
envsubst < /etc/mysql/init_var.sql > /etc/mysql/init.sql

echo "Fichier SQL généré avec succès : /docker-entrypoint-initdb.d/init.sql"

mysql_install_db
mysqld
