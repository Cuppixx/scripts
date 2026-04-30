#!/bin/bash
# Fix Unreal Engine 5 (AUR) permissions for C++ project creation on Linux
# Run with: bash fix-ue5-permissions.sh

set -e

echo "==> Fixing Unreal Engine 5 permissions..."

echo ">>> Making bundled dotnet executable..."
sudo chmod 755 /opt/unreal-engine/Engine/Binaries/ThirdParty/DotNet/8.0.300/linux-x64/dotnet

echo ">>> Creating unreal-engine group..."
sudo groupadd -f unreal-engine

echo ">>> Adding $USER to unreal-engine group..."
sudo usermod -aG unreal-engine "$USER"

echo ">>> Changing group ownership of /opt/unreal-engine..."
sudo chown -R root:unreal-engine /opt/unreal-engine

echo ">>> Setting group read/write/execute permissions..."
sudo chmod -R g+rwX /opt/unreal-engine

echo ">>> Setting broad permissions on Engine directory (AUR recommendation)..."
sudo chmod -R a+rwX /opt/unreal-engine/Engine

echo ">>> Patching SetupDotnet.sh to not abort on chmod failure..."
sudo sed -i 's/chmod u+x "\$UE_DOTNET_DIR\/dotnet"/chmod u+x "$UE_DOTNET_DIR\/dotnet" 2>\/dev\/null || true/' \
    /opt/unreal-engine/Engine/Build/BatchFiles/Linux/SetupDotnet.sh

echo ""
echo "==> Done! Please log out and back in for group membership to take effect."
echo "    Or run 'newgrp unreal-engine' in your current terminal session."