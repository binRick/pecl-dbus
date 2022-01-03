#!/bin/bash
cmd="${@:-bash}"
cmd="podman exec -it -l $cmd"
eval "$cmd"
