#!/bin/bash

echo ""
echo "Applying bluetooth fix..."
sudo touch /var/lib/bluetooth/board-address

echo ""
read -p "Enable ipa.service? [Y/n] " CH
if [ "$CH" == "y" ] || [ "$CH" == "Y" ]; then
    echo "Enabling ipa.service..."
    cat >> enable-ipa.service<< EOF
[Unit]
Description=Workaround
After=android-mount.service
Requires=android-mount.service

[Service]
Type=oneshot
ExecStart=/bin/sh -c 'echo 1 > /dev/ipa'

[Install]
WantedBy=local-fs.target
EOF
    
    sudo mv enable-ipa.service /etc/systemd/system/
    sudo systemctl enable enable-ipa
fi

echo ""
read -p "Apply notch-fix? [Y/n] " CH
if [ "$CH" == "y" ] || [ "$CH" == "Y" ]; then
    echo "Applying notch-fix..."
cat >>  ~/.config/gtk-3.0/gtk.css<< EOF
.phosh-topbar-clock {
   margin-left: 195px;
}

.phosh-panel-btn > box {
   margin-left: 0px;
   margin-right: 0px;
}

.phosh-power-button {
   margin-right: 50px;
}

EOF
    echo "Reboot is needed to take effect."
fi

echo ""
read -p "Install Waydroid? [Y/n] " CH
if [ "$CH" == "y" ] || [ "$CH" == "Y" ]; then
    echo "Installing Waydroid..."
    sudo apt install curl wget lxc python3 -y
    sudo apt install ca-certificates -y
    export DISTRO="bullseye" && \
    sudo curl -# --proto '=https' --tlsv1.2 -Sf https://repo.waydro.id/waydroid.gpg --output /usr/share/keyrings/waydroid.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/waydroid.gpg] https://repo.waydro.id/ $DISTRO main" > ~/waydroid.list && \
    sudo mv ~/waydroid.list /etc/apt/sources.list.d/waydroid.list && \
    sudo apt update
    sudo waydroid init
    sudo systemctl start waydroid-container
    echo ""
    echo "Installed Waydroid, may need to reboot to start it."
fi
