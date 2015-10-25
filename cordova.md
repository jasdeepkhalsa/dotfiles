# Connecting Android phone to Ubuntu 14.04

1. Check that the udev file is there: /etc/udev/rules.d/51-android.rules (if not, get it from backup/VCS). More info here: http://developer.android.com/tools/device.html#developer-device-options
2. Check the wire to connect the phone to the computer is not faulty. If it's faulty, the drive for the phone will not show up
3. Type `adb devices` to ensure it shows up as a device
4. Ensure Chrome is setup with remote debugging: https://developer.chrome.com/devtools/docs/remote-debugging
5. Now you can go ahead and type `ionic run` to install the app on the phone
