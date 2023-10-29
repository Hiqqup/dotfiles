grep "^\s*w" /proc/net/wireless | awk '{ print "w",int($3 * 100 /70) "%"}'

sed "s/down//;s/up/g/" /sys/class/net/e*/operstate
