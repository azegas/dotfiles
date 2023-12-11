#!/bin/bash

# # Fix time sync issues in WSL
# # https://github.com/microsoft/WSL/issues/8204#issuecomment-1338334154

# Check if systemd-timesyncd service is active
if ! systemctl is-active --quiet systemd-timesyncd; then
    # Run the code to fix time sync issues in WSL
    sudo mkdir -p /etc/systemd/system/systemd-timesyncd.service.d
    sudo tee /etc/systemd/system/systemd-timesyncd.service.d/override.conf > /dev/null <<EOF
[Unit]
ConditionVirtualization=
EOF
    # start the time syncing service
    sudo systemctl start systemd-timesyncd
    echo "systemd-timesyncd has been started"
else
    echo "systemd-timesyncd service is already active."
fi
