#!/bin/sh
defgw=`ip route | awk '/default/ { print $3 }'`
failures=5

logger "merlinwatchdog: Checking connection to default gateway $defgw..."
i=$failures
while ! ping -c1 $defgw
do
  logger "merlinwatchdog: Could not reach the default gateway $defgw, Attempts: $i"
  i=$(($i-1))
  if [ $i -lt 1 ]
  then
    logger "merlinwatchdog: Attempts exhausted connecting to $defgw, attempting reconnection..."
    killall -SIGUSR2 udhcpc
    sleep 2
    killall -SIGUSR1 udhcpc
    break 1
  fi
  sleep 2
done
