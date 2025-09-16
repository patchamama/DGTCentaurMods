#!/bin/bash

# Script para alternar entre DGTCentaurMods y DGTCentaurMods_1.3.3

SERVICES_DEFAULT=("DGTCentaurMods.service" "DGTCentaurModsWeb.service")
SERVICES_133=("DGTCentaurMods_1.3.3.service" "DGTCentaurModsWeb_1.3.3.service")

# Función para detener y deshabilitar un grupo de servicios
stop_disable() {
    for svc in "$@"; do
        sudo systemctl stop "$svc" 2>/dev/null
        sudo systemctl disable "$svc" 2>/dev/null
    done
}

# Función para iniciar y habilitar un grupo de servicios
start_enable() {
    for svc in "$@"; do
        sudo systemctl enable "$svc"
        sudo systemctl start "$svc"
    done
}

# Detectar cuál está activo
is_active() {
    systemctl is-active --quiet "$1"
}

if is_active "${SERVICES_DEFAULT[0]}"; then
    echo ">>> Se detectó la versión DEFAULT en ejecución. Cambiando a 1.3.3..."
    stop_disable "${SERVICES_DEFAULT[@]}"
    start_enable "${SERVICES_133[@]}"
    echo ">>> Ahora está activa la versión 1.3.3."
elif is_active "${SERVICES_133[0]}"; then
    echo ">>> Se detectó la versión 1.3.3 en ejecución. Cambiando a DEFAULT..."
    stop_disable "${SERVICES_133[@]}"
    start_enable "${SERVICES_DEFAULT[@]}"
    echo ">>> Ahora está activa la versión DEFAULT."
else
    echo ">>> No se detectó ninguna versión activa. Activando DEFAULT por defecto..."
    stop_disable "${SERVICES_133[@]}"
    start_enable "${SERVICES_DEFAULT[@]}"
    echo ">>> Ahora está activa la versión DEFAULT."
fi
