#!/bin/bash
set -ex

cp -v modules/dbus.so $(./GET_PHP_EXTENSION_DIR.sh)
cp -v 99-dbus.ini $(./GET_PHP_D_DIR.sh)
