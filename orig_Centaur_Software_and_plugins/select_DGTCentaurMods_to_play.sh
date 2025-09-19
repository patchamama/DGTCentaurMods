#!/bin/bash

while true; do
    # Mostrar IP activa (tomando la primera IPv4 no-loopback)
    ip=$(hostname -I | awk '{print $1}')
    echo "===================================="
    echo " Active IP: $ip"
    echo "===================================="

    # Construir menú
    dirs=(/opt/*)
    menu=("Centaur (default)")   # Opción especial al inicio
    for d in "${dirs[@]}"; do
        menu+=("$(basename "$d")")
    done
    menu+=("Restart" "Shutdown" "Exit")

    echo "=== Menu Options ==="
    select choice in "${menu[@]}"; do
        if [[ -z "$choice" ]]; then
            echo "Invalid selection. Try again."
            break
        fi

        case "$choice" in
            "Centaur (default)"|"centaur")
                echo "Configuring services for centaur..."
                sudo systemctl disable DGTCentaurMods.service
                sudo systemctl stop DGTCentaurMods.service
                sudo systemctl disable DGTCentaurMods_Web.service
                sudo systemctl stop DGTCentaurMods_Web.service
                sudo systemctl enable centaur.service
                sudo systemctl start centaur.service
                ;;
            "Restart")
                echo "Restarting system..."
                sudo shutdown -r now
                ;;
            "Shutdown")
                echo "Shutting down system..."
                sudo shutdown now
                ;;
            "Exit")
                echo "Exiting..."
                exit 0
                ;;
            *)
                selected="$choice"
                echo "You selected: $selected"

                # Verificar si centaur.service está activo y detenerlo
                if systemctl is-active --quiet centaur.service; then
                    echo "Stopping centaur.service..."
                    sudo systemctl stop centaur.service
                fi

                echo "Running activate_only_service.sh for $selected..."
                sudo bash activate_only_service.sh "$selected"
                ;;
        esac

        echo "Done. Returning to menu..."
        break
    done
done
