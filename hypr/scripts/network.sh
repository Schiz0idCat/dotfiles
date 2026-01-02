#!/bin/sh

default_iface() {
	ip route show default 2>/dev/null | awk '{print $5; exit}'
}

status() {
	iface=$(default_iface)

	[ -z "$iface" ] && return 3 # Disconnected

	if [ -d "/sys/class/net/$iface/wireless" ]; then
		return 2   # Wi-Fi
	else
		return 1   # Ethernet
	fi
}

name() {
	iface=$(default_iface)

	[ -z "$iface" ] && {
		echo "Disconnected"
		return
	}

	name="$iface"

	if [ "${#name}" -gt 12 ]; then
		name="$(printf '%s' "$name" | cut -c1-9)..."
	fi

	echo "$name"
}

case "$1" in
	"-s" )
		status
		case "$?" in
			1)
				echo "<span>  </span>";;
			2)
				echo "<span>  </span>";;
			3)
				echo "<span>  </span>";;
		esac;;
	"-n" )
		name;;
esac
