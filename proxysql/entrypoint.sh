#!/bin/bash

cd /opt/proxysql
make -j 8 debug

rm -rf /var/lib/proxysql
mkdir /var/lib/proxysql

exec "$@"
