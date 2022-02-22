# ASUS Merlin Watchdog
A simple watchdog service for ASUS Merlin firmware.

This script is based on https://github.com/elislusarczyk/merlin-wan-watchdog with adaptations.

The script checks pings against the default gateway received from your ISP. If they fail or timeout, it attempts to ping the default gateway 5 more times. If no response is received from the default gateway after 5 times, it kills the dhcpc service which spawns a restart of the WAN interface.

# Installation
- In the "Administration" -> "System" menu, enable SSH and the "Enable JFFS custom scripts and configs" option.
- Upload the "services-start" and "merlinwatchdog.sh" to /jffs/scripts
- In the SSH terminal, run: chmod a+x /jffs/scripts/merlinwatchdog.sh /jffs/scripts/services-start; /jffs/scripts/services-start
- You're done!
