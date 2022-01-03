while :; do socat -d -d -d UNIX-CONNECT:/run/dbus/system_bus_socket TCP:127.0.0.1:49225||sleep 1; sleep .1; done
