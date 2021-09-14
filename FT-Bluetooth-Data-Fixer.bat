@echo off
echo "Searching for corrupted bluetooth devices..."
for /f "tokens=1,2" %%a in ('netsh wlan show drivers ^| findstr "Hosted network supported  : Yes"') do (
echo "Device %%b is corrupted!"
)
echo "Resetting corrupted bluetooth devices..."
for /f "tokens=1,2" %%a in ('netsh wlan show drivers ^| findstr "Hosted network supported  : Yes"') do (
echo "Resetting device %%b..."
netsh wlan delete profile name="%%b" interface="Wi-Fi"
)
echo "Done!"