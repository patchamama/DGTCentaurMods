# # 1) Copiar el script a /usr/local/bin (ajusta si está en otra ruta)
# sudo cp ~/select_DGTCentaurMods_to_play.sh /usr/local/bin/select_DGTCentaurMods_to_play.sh
# sudo chown root:root /usr/local/bin/select_DGTCentaurMods_to_play.sh
# sudo chmod 755 /usr/local/bin/select_DGTCentaurMods_to_play.sh

# # 2) Permitir que el usuario pi ejecute SOLO este script como root sin contraseña
# echo 'pi ALL=(root) NOPASSWD: /usr/local/bin/select_DGTCentaurMods_to_play.sh' | sudo tee /etc/sudoers.d/centaur >/dev/null
# sudo chmod 440 /etc/sudoers.d/centaur

# # 3) Agregar al final de ~/.profile del usuario pi
cat << 'EOF' | sudo tee -a /home/pi/.profile >/dev/null

# >>> Ejecutar Centaur al login del usuario pi >>>
if [ "$(id -un)" = "pi" ]; then
    if [ -n "$PS1" ] || [ -n "$SSH_CONNECTION" ]; then
        sudo /usr/local/bin/select_DGTCentaurMods_to_play.sh
    fi
fi
# <<< Fin >>>
EOF

# 4) Asegurar que el archivo .profile pertenezca a pi
sudo chown pi:pi /home/pi/.profile
