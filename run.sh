
podman run --name php-dbus --rm -it \
  -v ./container-socat.sh:/socat.sh:ro \
  -v ./container-tests.sh:/tests.sh:ro \
-p 49225:49225 php-dbus $@
