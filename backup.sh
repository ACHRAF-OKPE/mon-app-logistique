#!/bin/bash

# 📅 Générer un nom de fichier avec la date et l'heure
DATE=$(date +"%Y-%m-%d_%H-%M")
BACKUP_FILE="/tmp/odoo_backup_$DATE.dump"

# 📁 Créer un dossier de sauvegarde local s'il n'existe pas
mkdir -p ./backups

echo "🗄️ Sauvegarde de la base odoo en cours..."

# 📤 Lancer la commande pg_dump dans le conteneur
docker exec odoo-db pg_dump -U odoo -F c odoo > ./backups/odoo_backup_$DATE.dump

# ✅ Fin
echo "✅ Sauvegarde terminée : ./backups/odoo_backup_$DATE.dump"
