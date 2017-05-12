#!/bin/bash

cd /opt/proxysql
make -j 4

rm -rf /var/lib/proxysql
mkdir /var/lib/proxysql

/opt/proxysql/src/proxysql --initial -c /etc/proxysql.cfg -D /var/lib/proxysql

exec "$@"
