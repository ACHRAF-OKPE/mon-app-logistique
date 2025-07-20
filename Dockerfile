FROM odoo:17

# Créer le dossier pour les modules
RUN mkdir -p /mnt/extra-addons

# Copier uniquement le dossier qui existe
COPY ./custom_addons /mnt/extra-addons

# Copier la config Odoo (si elle existe déjà)
COPY ./config/odoo.conf /etc/odoo/odoo.conf
