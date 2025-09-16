# export PYTHONPATH=/opt
# cd /opt/DGTCentaurMods/web
# authbind --deep flask run --host=0.0.0.0 --port=80

systemctl disable centaur.service
systemctl disable DGTCentaurModsWeb_1.3.3.service
systemctl disable DGTCentaurModsWeb_1.3.3.service

systemctl enable DGTCentaurMods.service
systemctl enable DGTCentaurModsWeb.service

systemctl stop centaur.service
systemctl stop DGTCentaurMods_1.3.3.service
systemctl stop DGTCentaurModsWeb_1.3.3.service

systemctl restart DGTCentaurMods.service
systemctl restart DGTCentaurModsWeb.service

systemctl status DGTCentaurMods.service
systemctl status DGTCentaurModsWeb.service