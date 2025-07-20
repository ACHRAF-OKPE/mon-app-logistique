FROM odoo:17

# Copier les modules si tu en as
COPY ./addons /mnt/extra-addons
COPY ./custom_addons /mnt/extra-addons

# Copier la configuration
COPY ./config/odoo.conf /etc/odoo/odoo.conf
