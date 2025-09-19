# export PYTHONPATH=/opt
# cd /opt/DGTCentaurMods/web
# authbind --deep flask run --host=0.0.0.0 --port=80

# sudo systemctl disable centaur.service
# sudo systemctl disable DGTCentaurModsWeb_1.3.3.service
# sudo systemctl disable DGTCentaurModsWeb_1.3.3.service

# sudo systemctl enable DGTCentaurMods.service
# sudo systemctl enable DGTCentaurModsWeb.service

# sudo systemctl stop DGTCentaurModsWeb_1.3.3.service
# sudo systemctl stop DGTCentaurModsWeb_1.3.3.service
# sudo systemctl stop DGTCentaurMods.service
# sudo systemctl stop DGTCentaurModsWeb.service

# sudo systemctl start centaur.service
# sudo systemctl status centaur.service

sudo bash activate_only_service.sh centaur