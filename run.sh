
podman run --name php-dbus --rm -it \
  -v ./container-socat.sh:/container-socat.sh:ro \
  -v ./container-tests.sh:/container-tests.sh:ro \
-p 49225:49225 php-dbus $@
