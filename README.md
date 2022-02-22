# ASUS Merlin Watchdog
A simple watchdog service for ASUS Merlin firmware.

The script checks pings against the default gateway received from your ISP.

If a ping times out, it attempts to ping the default gateway 5 more times. If no response is received from the default gateway after 5 times, it kills the dhcpc service and forces a reconnect of the WAN interface.

# Installation
- Login to the router configuration page
- In the `Administration --> System` menu, enable SSH and the `Enable JFFS custom scripts and configs` option.

![image](https://user-images.githubusercontent.com/7189075/155067866-9278ed03-c00e-4baa-95d1-d5234f554be5.png)

![image](https://user-images.githubusercontent.com/7189075/155067935-f95beecc-0c3a-47e8-9ec6-f1758f040117.png)
- Upload the `services-start` and `merlinwatchdog.sh` to `/jffs/scripts`
- In the SSH terminal, run: `chmod a+x /jffs/scripts/merlinwatchdog.sh /jffs/scripts/services-start; /jffs/scripts/services-start`
- You're done!

# Thanks
This script is based on https://github.com/elislusarczyk/merlin-wan-watchdog with adaptations.
