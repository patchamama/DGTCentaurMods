#!/bin/bash
# Script to add a new WiFi network and show current status

WPA_CONF="/etc/wpa_supplicant/wpa_supplicant.conf"

# --- Show current status ---
echo "📡 Scanning for available WiFi networks..."
sudo iwlist wlan0 scan | grep 'ESSID' | awk -F\" '{print " - " $2}' | sort -u

echo
CURRENT=$(iwgetid -r)
if [ -n "$CURRENT" ]; then
    IP=$(ip addr show $INTERFACE | grep "inet " | awk '{print $2}' | cut -d/ -f1)
    echo
    echo "✅ Now connected to: $CURRENT"
    echo "🌐 Local IP address: $IP"
else
    echo "❌ Not connected to any WiFi network."
fi
echo

# --- Ask user for WiFi details ---
read -p "Enter WiFi SSID: " SSID
read -p "Enter WiFi password: " PSK
echo
echo "Adding WiFi network '$SSID'..."

# --- Generate configuration block ---
NEW_ENTRY=$(wpa_passphrase "$SSID" "$PSK")

# --- Backup configuration ---
sudo cp "$WPA_CONF" "$WPA_CONF.bak.$(date +%s)"

# --- Add new network if not already present ---
if grep -q "ssid=\"$SSID\"" "$WPA_CONF"; then
    echo "⚠️  Network '$SSID' already exists in configuration. Skipping."
else
    echo "$NEW_ENTRY" | sudo tee -a "$WPA_CONF" > /dev/null
    echo "✅ Network added to configuration."
fi

# --- Reload wpa_supplicant ---
sudo wpa_cli -i wlan0 reconfigure

# --- Show configured networks ---
echo
echo "📋 Configured networks:"
grep 'ssid="' "$WPA_CONF" | awk -F\" '{print " - " $2}'

# --- Show updated connection status ---
echo
sleep 3
CURRENT=$(iwgetid -r)
if [ -n "$CURRENT" ]; then
    IP=$(ip addr show $INTERFACE | grep "inet " | awk '{print $2}' | cut -d/ -f1)
    echo
    echo "✅ Now connected to: $CURRENT"
    echo "🌐 Local IP address: $IP"
else
    echo "❌ Still not connected. Check SSID/password."
fi
