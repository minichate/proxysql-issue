#!/bin/bash

dockerize -wait tcp://forwarder:3306 -wait tcp://forwarder:6032 -wait tcp://db:3306 -wait tcp://router:3306 -wait tcp://router:6032 -timeout 60s

function user_one() {
  mysql -u root -pstompy -h forwarder -e "use helloworld; select @@hostname" &> /dev/null
}

function user_two() {
  mysql -u user -ppassword -h forwarder -e "use helloworld; select @@hostname" &> /dev/null
}

echo "Generating Load... "

for i in `seq 1 500`;
do
  user_one &
  user_two &
done

wait
