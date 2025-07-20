#!/bin/bash

# Nom du fichier de sauvegarde (à adapter si besoin)
BACKUP_FILE="backups/odoo_backup_2025-07-19_06-58.dump"

# Nom du conteneur de la base de données de test
DB_CONTAINER="odoo-db-test"

echo "♻️ Restauration de la base de données dans l'environnement de test..."

# Copier le fichier de sauvegarde dans le conteneur
docker cp "$BACKUP_FILE" "$DB_CONTAINER":/tmp/backup.dump

# Exécuter les commandes dans le conteneur
docker exec -it "$DB_CONTAINER" bash -c "
psql -U odoo -d postgres -c 'DROP DATABASE IF EXISTS odoo;';
psql -U odoo -d postgres -c 'CREATE DATABASE odoo OWNER odoo;';
pg_restore -U odoo -d odoo /tmp/backup.dump
"

echo "✅ Restauration terminée. Accède à : http://localhost:8050"
