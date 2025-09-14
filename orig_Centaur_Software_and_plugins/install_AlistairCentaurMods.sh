sudo apt-get update

# sudo apt install ntp -y

# wget https://github.com/EdNekebno/DGTCentaurMods/releases/download/v1.3.3/dgtcentaurmods_1.3.3_armhf.deb

# sudo apt install -y ./dgtcentaurmods_1.3.3_armhf.deb

wget https://raw.githubusercontent.com/patchamama/DGTCentaurMods/refs/heads/master/orig_Centaur_Software_and_plugins/S03centaur
wget https://raw.githubusercontent.com/patchamama/DGTCentaurMods/refs/heads/master/orig_Centaur_Software_and_plugins/wifi-setup.txt

wget https://raw.githubusercontent.com/patchamama/DGTCentaurMods/refs/heads/master/orig_Centaur_Software_and_plugins/centaur_ald_with_ring.zip
unzip centaur_ald_with_ring.zip
sudo chmod +x centaur/centaur
sudo cp S03centaur /etc/init.d 
sudo chmod +x /etc/init.d/S03centaur

wget https://raw.githubusercontent.com/patchamama/DGTCentaurMods/refs/heads/master/orig_Centaur_Software_and_plugins/centaur.service
sudo cp centaur.service /etc/systemd/system/centaur.service
sudo systemctl daemon-reload
sudo systemctl enable centaur.service
sudo systemctl start centaur.service

wget -O ./_DGTCentaurMods_A.alpha-latest.deb `curl -s https://api.github.com/repos/Alistair-Crompton/DGTCentaurMods/releases/latest | grep browser_download_url | cut -d '"' -f 4`
sudo apt install -y python3-dev python3-pip python3-venv build-essential libjpeg-dev zlib1g-dev libtiff-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev
sudo apt install -y libffi-dev


# cd /opt/DGTCentaurMods
# python3 -m venv venv
# source venv/bin/activate
# pip install --upgrade pip

pip3 install --user --upgrade "MarkupSafe>=2.1.1"
pip3 install --user --upgrade Pillow>=10.0.1
pip3 install --upgrade --force-reinstall PyGithub==1.55


sudo apt install -y ./_DGTCentaurMods_A.alpha-latest.deb

# Try to install again
pip3 install --user --upgrade "MarkupSafe>=2.1.1"
pip3 install --user --upgrade Pillow>=10.0.1
pip3 install --upgrade --force-reinstall PyGithub==1.55

wget https://raw.githubusercontent.com/patchamama/DGTCentaurMods/refs/heads/master/orig_Centaur_Software_and_plugins/DGTCentaurModsWeb.service
sudo cp DGTCentaurModsWeb.service /etc/systemd/system/DGTCentaurModsWeb.service
sudo cp /etc/systemd/system/DGTCentaurModsWeb.service /etc/systemd/system/DGTCentaurModsWeb.service.backup
sudo systemctl daemon-reload
sudo systemctl restart DGTCentaurModsWeb.service
sudo systemctl status DGTCentaurModsWeb.service


# Install one by one every python package
# while read req; do echo ">>> Instalando $req"; pip3 install --user "$req"; done < pip-requirements.txt

# Desinstall all the package and install every again with the correct version:
# while read req; do echo ">>> Reinstalando $req"; pip3 uninstall -y $(echo $req | cut -d'=' -f1); pip3 install --user "$req"; done < pip-requirements.txt

# pip3 install --user -r /opt/DGTCentaurMods/config/requirements.txt

# cd /opt/DGTCentaurMods/web
# export PYTHONPATH=/opt
# authbind --deep flask run --host=0.0.0.0 --port=80

