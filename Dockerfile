FROM odoo:17

# Créer le dossier pour les modules
RUN mkdir -p /mnt/extra-addons

# Copier les modules
COPY ./custom_addons /mnt/extra-addons

# Copier la configuration
COPY ./config/odoo.conf /etc/odoo/odoo.conf

# Lancer Odoo avec les variables injectées à l’exécution
CMD ["bash", "-c", "odoo --config=/etc/odoo/odoo.conf --db_host=$HOST --db_port=$PGPORT --db_user=$USER --db_password=$PASSWORD"]
