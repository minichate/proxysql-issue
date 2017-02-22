#!/bin/bash

docker-compose run --rm test
docker-compose logs proxysql-forwarder | grep 2013
