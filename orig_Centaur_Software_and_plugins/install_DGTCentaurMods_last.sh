sudo apt-get update

sudo apt install ntp -y

wget https://github.com/EdNekebno/DGTCentaurMods/releases/download/v1.3.3/dgtcentaurmods_1.3.3_armhf.deb

sudo apt install -y ./dgtcentaurmods_1.3.3_armhf.deb

wget https://raw.githubusercontent.com/patchamama/DGTCentaurMods/refs/heads/master/orig_Centaur_Software_and_plugins/wifi-setup.txt

# wget https://raw.githubusercontent.com/patchamama/DGTCentaurMods/refs/heads/master/orig_Centaur_Software_and_plugins/S03centaur
# wget https://raw.githubusercontent.com/patchamama/DGTCentaurMods/refs/heads/master/orig_Centaur_Software_and_plugins/centaur_ald_with_ring.zip3
# unzip centaur_ald_with_ring.zip
# sudo chmod +x centaur/centaur
# sudo cp S03centaur /etc/init.d 
# sudo chmod +x /etc/init.d/S03centaur

# wget https://raw.githubusercontent.com/patchamama/DGTCentaurMods/refs/heads/master/orig_Centaur_Software_and_plugins/centaur.service
# sudo cp centaur.service /etc/systemd/system/centaur.service
# sudo systemctl daemon-reload
# sudo systemctl enable centaur.service
# sudo systemctl start centaur.service

