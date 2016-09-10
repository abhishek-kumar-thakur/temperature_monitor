#!/bin/sh

#installs the temperature monitor service to start automatically


source="$(pwd)/temperature_monitor"
target="/etc/init.d/temperature_monitor"

if [ -f $target ] ; then
	echo "uninstalling service at $target"
	$target stop 
	rm -f $target
	systemctl daemon-reload
fi

echo "installing service at $target"
cp $source $target
chmod 755 $target
update-rc.d temperature_monitor defaults
$target status
