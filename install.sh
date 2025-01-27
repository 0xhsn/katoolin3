#!/bin/bash

set -e

# Check if root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root. Use sudo to run it." 1>&2
   exit 1
fi

echo "========================================================="
echo " Katoolin3 Installation Script for Ubuntu"
echo "========================================================="

# Update & Upgrade
echo "[*] Updating and upgrading the system..."
apt update && apt upgrade -y

# Install Dependencies
echo "[*] Installing dependencies..."
apt install -y git python3 python3-apt wget apt-transport-https software-properties-common

# Clone Katoolin3 Repository
echo "[*] Cloning the Katoolin3 GitHub repository..."
if [[ -d "katoolin3" ]]; then
    echo "Katoolin3 repository already exists. Pulling latest changes..."
    cd katoolin3 && git pull && cd ..
else
    git clone https://github.com/s-h-3-l-l/katoolin3.git
fi

# Make `install.sh` Executable + Run It
echo "[*] Installing Katoolin3..."
cd katoolin3
chmod +x ./install.sh
./install.sh

# Configure PATH
echo "[6/8] Configuring global access to Katoolin3..."
if ! grep -Fxq "export PATH=\$PATH:$(pwd)" ~/.bashrc; then
    echo "export PATH=\$PATH:$(pwd)" >> ~/.bashrc
    echo "Katoolin3 path added to ~/.bashrc"
    source ~/.bashrc
else
    echo "Katoolin3 path is already in ~/.bashrc"
fi

# Success
echo "[+] Installation completed successfully!"
echo "Note: Use 'sudo katoolin3' to run with proper permissions."
exit 0

