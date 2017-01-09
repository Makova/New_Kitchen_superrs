#!/sbin/sh

SLOT=$(for i in $(cat /proc/cmdline); do echo $i | grep slot | dd bs=1 skip=24 2>/dev/null; done)
if [ $SLOT != "" ]; then
    echo "slotnum=$SLOT" > /tmp/slotsel
elif [ $(cat /etc/recovery.fstab 2>/dev/null | grep boot_a) != "" ]; then
    echo "slotnum=_a" > /tmp/slotsel
else
    echo "none" > /tmp/slotsel
fi
