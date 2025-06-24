# USB Tethering Tool

A cross-platform tool to enable USB tethering from an Android device to a laptop without interacting with the mobile interface. This tool automates the process of enabling USB tethering using the Android Debug Bridge (ADB).

## Features
- Supports Windows, Linux, and macOS.
- Automatically detects the operating system and uses the appropriate ADB binary.
- Retries enabling USB tethering up to 5 times in case of failures.
- Provides a Python wrapper for consistent execution across platforms.
- Includes platform-specific scripts for enabling tethering.

## Prerequisites
- An Android device with **USB debugging** enabled.
- A USB cable to connect the device to your computer.
- Python 3.6+ (required for running `usb_tether_launcher.py`).
- No additional installation of ADB is required, as platform-specific binaries are included.

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

### 2. Clone the Repository
```bash
https://github.com/CKShetty4/USB-Tether.git
cd USB-Tether
```

### 3. Run the Tool
Run the Python script to enable USB tethering:
```bash
python usb_tether_launcher.py
```

The script will:
- Detect your operating system (Windows, Linux, or macOS).
- Use the appropriate platform-specific ADB binary from the `platform-tools` directory.
- Execute the corresponding script (`enable_tethering.bat` for Windows or `enable_tethering.sh` for Linux/macOS).
- Attempt to enable USB tethering with retries if needed.

## Project Structure
```
USB-Tether/
├── enable_tethering.bat      # Windows batch script for enabling tethering
├── enable_tethering.sh       # Shell script for Linux/macOS
├── usb_tether_launcher.py    # Python wrapper for cross-platform execution
├── platform-tools/           # Directory containing ADB binaries
│   ├── linux/                # Linux-specific ADB binary and dependencies
│   ├── mac/                  # macOS-specific ADB binary and dependencies
│   ├── windows/              # Windows-specific ADB binary and dependencies
├── License                   # License file
└── README.md                 # This file
```

## How It Works
1. **Python Launcher (`usb_tether_launcher.py`)**:
   - Detects the operating system.
   - Runs the appropriate platform-specific script (`enable_tethering.bat` or `enable_tethering.sh`).
   - Ensures the script is executable on Unix-based systems.

2. **Platform-Specific Scripts**:
   - **Windows (`enable_tethering.bat`)**: Uses `adb.exe` to set the USB function to `rndis` (Remote Network Driver Interface Specification) for tethering.
   - **Linux/macOS (`enable_tethering.sh`)**: Uses the respective ADB binary to set the USB function to `rndis`.
   - Both scripts retry up to 5 times with a 2-second delay between attempts if the command fails.

3. **ADB Binaries**:
   - The `platform-tools` directory includes ADB binaries for Windows, Linux, and macOS, along with necessary dependencies (e.g., `libc++.so` for Linux, `libc++.dylib` for macOS, and `AdbWinApi.dll` for Windows).

## Troubleshooting
- **No devices found**: Ensure your Android device is connected via USB and USB debugging is enabled.
- **Permission denied on Linux/macOS**: The script automatically sets execute permissions, but you can manually run `chmod +x platform-tools/linux/adb` or `chmod +x platform-tools/mac/adb`.
- **ADB command fails**: Verify that the USB cable is functional and the device is properly connected.
- **Unsupported OS error**: The tool supports Windows, Linux, and macOS only. Ensure you are using a supported operating system.

## License
This project is licensed under the MIT License. See the [License](License) file for details.

## Contributing
Contributions are welcome! Please open an issue or submit a pull request on GitHub.

## Contact
For questions or support, please open an issue on the [GitHub repository](https://github.com/CKShetty4/USB-Tether/issues).
