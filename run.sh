#!/bin/bash

docker-compose run --rm test
docker-compose logs forwarder | grep 2013
