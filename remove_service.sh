#!/bin/sh

#removes the temperature monitor service if it exists

target=/etc/init.d/temperature_monitor

if [ -f $target ] ; then
        echo "uninstalling service at $target"
        $target stop
        rm -f $target
        systemctl daemon-reload
fi

