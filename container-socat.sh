[[ -d /run/dbus ]] || mkdir -p /run/dbus
ln -sf /dbus.sock /run/dbus/system_bus_socket
socat -d -d -d -d TCP-LISTEN:49225,fork,reuseaddr UNIX-LISTEN:/dbus.sock
