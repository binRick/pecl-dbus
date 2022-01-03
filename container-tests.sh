#!/bin/bash
set -ex

cd /examples

for x in *.php; do 
  
  timeout 1 php $x || true
  sleep .3
done
