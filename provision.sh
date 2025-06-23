
#!/bin/bash

# Met à jour la liste des paquets
sudo apt-get update

# Installe samba, htop, curl, vim, apache2
sudo apt-get install -y samba htop curl vim apache2

# Active et démarre Apache2
sudo systemctl enable apache2
sudo systemctl start apache2

# Configuration basique Samba (partage public)
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.backup

echo "
[public]
   path = /srv/samba/public
   browseable = yes
   read only = no
   guest ok = yes
" | sudo tee -a /etc/samba/smb.conf

sudo mkdir -p /srv/samba/public
sudo chmod -R 0777 /srv/samba/public
sudo systemctl restart smbd

sudo apt-get clean
