# USB-Tether

A cross-platform tool to enable USB tethering from an Android device to a laptop without using the mobile interface. This tool uses ADB (Android Debug Bridge) to automate the process and is packaged as a single executable for Windows, macOS, and Linux.

## Features
- Enable USB tethering with a single executable.
- Cross-platform support: Windows, macOS, Linux.
- Bundled ADB tools, no separate installation required.
- Automatic platform detection and cleanup of unnecessary files.
- User-friendly setup instructions for enabling USB debugging.

## Prerequisites
- An Android device with USB debugging enabled.
- A USB cable to connect the device to your computer.

## Setup Instructions

### 1. Enable USB Debugging on Your Android Device
To use this tool, USB debugging must be enabled on your Android device:
1. Open **Settings** on your Android device.
2. Go to **About phone**.
3. Tap **Build number** 7 times to enable **Developer Options**.
4. Go back to **Settings**, find **Developer Options**.
5. Enable **USB debugging**.
6. Connect your device to your computer via USB.
7. When prompted on your device, allow USB debugging for this computer.

### 2. Download the Executable
- Go to the [Releases](https://github.com/CKShetty4/USB-Tether/releases) page.
- Download the appropriate executable for your platform:
  - `usb-tether-windows.exe` for Windows
  - `usb-tether-macos` for macOS
  - `usb-tether-linux` for Linux

### 3. Run the Executable
- **Windows**: Double-click `usb-tether-windows.exe` or run it from a Command Prompt.
- **macOS**: Run `chmod +x usb-tether-macos` in a terminal, then double-click or run `./usb-tether-macos`.
- **Linux**: Run `chmod +x usb-tether-linux` in a terminal, then double-click or run `./usb-tether-linux`.

The executable will:
1. Detect your platform.
2. Extract necessary files to a user-specific directory (`%APPDATA%\USB-Tether` on Windows, `~/.usb-tether` on macOS/Linux).
3. Remove unnecessary platform-specific files.
4. Guide you through enabling USB tethering.

### 4. Troubleshooting
- **No devices found**: Ensure your device is connected, USB debugging is enabled, and you have authorized the computer.
- **ADB errors**: Ensure no other ADB instances are running (`adb kill-server` may help).
- **Tethering fails**: Some devices may not support RNDIS mode. Check your device's compatibility.

## Development
To build the executable yourself:
1. Clone the repository:
   ```bash
   git clone https://github.com/CKShetty4/USB-Tether.git
   cd USB-Tether
   ```
2. Install PyInstaller:
   ```bash
   pip install pyinstaller
   ```
3. Run the build script (see `build.py` in the repository).
4. Find the executable in the `dist` directory.

## Repository Structure
```
USB-Tether/
├── platform-tools/
│   ├── windows/        # ADB tools for Windows
│   ├── mac/            # ADB tools for macOS
│   ├── linux/          # ADB tools for Linux
├── enable_tethering.bat # Windows script
├── enable_tethering.sh  # macOS/Linux script
├── setup_tethering.py   # Core setup script
├── usb_tether_launcher.py # Launcher script for executable
└── README.md            # This file
```

## Contributing
Contributions are welcome! Please submit a pull request or open an issue on the [GitHub repository](https://github.com/CKShetty4/USB-Tether).

## License
This project includes Android SDK Platform-Tools, which are subject to the [Android Software Development Kit License Agreement](https://developer.android.com/studio/terms). The scripts are licensed under the MIT License.