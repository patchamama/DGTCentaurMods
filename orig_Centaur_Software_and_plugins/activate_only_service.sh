#!/bin/bash

# Script to manage systemd services based on /opt directories
# - Always: disable & stop all services derived from /opt directories
# - If one argument is passed: also enable & start the services for that name

manage_service() {
    local action=$1
    local service=$2

    if systemctl list-unit-files | grep -q "^${service}"; then
        echo "  -> $action $service"
        sudo systemctl $action "$service"
    else
        echo "  !! Service $service does not exist"
    fi
}

# echo ">>> Disabling and stopping services from /opt/* ..."
# for dir in /opt/*; do
#     if [ -d "$dir" ]; then
#         service_name=$(basename "$dir")
#         echo ">>> Processing directory: $service_name"
#         for suffix in "" "_Web"; do
#             svc="${service_name}${suffix}.service"
#             manage_service disable "$svc"
#             manage_service stop "$svc"
#         done
#     fi
# done
# echo ">>> Finished disabling and stopping all services."

if [ $# -gt 0 ]; then

    service_name="$1"
    echo ">>> Activating $1..."
    # manage_service stop centaur
    # manage_service enable centaur
    
    # sudo rm -r /opt/DGTCentaurMods
    # sudo cp -r /opt/$service_name /opt/DGTCentaurMods

    sudo rm -rf /opt/DGTCentaurMods
    sudo ln -s /opt/$service_name /opt/DGTCentaurMods

    echo ">>> Parameter provided: $service_name"
    echo ">>> Enabling and starting related services..."
    for suffix in "" "_Web"; do
        # svc="${service_name}${suffix}.service"
        svc="DGTCentaurMods${suffix}.service"
        manage_service enable "$svc"
        manage_service restart "$svc"
    done
    echo ">>> Finished enabling and starting $service_name services."
fi