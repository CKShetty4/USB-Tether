#!/bin/sh

OS="$(uname)"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ "$OS" = "Darwin" ]; then
    ADB="$SCRIPT_DIR/platform-tools/mac/adb"
elif [ "$OS" = "Linux" ]; then
    ADB="$SCRIPT_DIR/platform-tools/linux/adb"
else
    echo "[ERROR] Unsupported OS: $OS"
    exit 1
fi

chmod +x "$ADB"

echo "[INFO] Listing devices..."
"$ADB" devices

RETRIES=5
DELAY=2

while [ $RETRIES -gt 0 ]; do
    echo "[INFO] Setting USB function to RNDIS..."
    "$ADB" shell svc usb setFunctions rndis

    if [ $? -eq 0 ]; then
        echo "[INFO] USB Tethering enabled successfully."
        exit 0
    else
        RETRIES=$((RETRIES - 1))
        if [ $RETRIES -eq 0 ]; then
            echo "[ERROR] Failed to set USB function after retries."
            exit 255
        fi
        echo "[WARN] Failed, retrying in $DELAY seconds... ($RETRIES attempts left)"
        sleep $DELAY
    fi
done
