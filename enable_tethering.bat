@echo off
setlocal

echo [INFO] Current directory: %~dp0platform-tools\windows
set "PATH=%~dp0platform-tools\windows;%PATH%"

echo [INFO] Listing devices...
adb devices

set "RETRIES=5"
set "DELAY=2"

:retry
echo [INFO] Setting USB function to RNDIS...
adb shell svc usb setFunctions rndis
if %errorlevel%==0 (
    echo [INFO] USB Tethering enabled successfully.
    exit /b 0
) else (
    if %RETRIES%==0 (
        echo [ERROR] Failed to set USB function after retries.
        exit /b 255
    )
    echo [WARN] Failed, retrying in %DELAY% seconds... (%RETRIES% attempts left)
    timeout /t %DELAY% /nobreak >nul
    set /a RETRIES-=1
    goto retry
)
