<?php

$link = mysql_connect('router', 'root', 'stompy');

function doTheThing() {
  mysql_select_db('live28');
  $result = mysql_query('select * from pet where name="Puffball" limit 1');
  while ($line = mysql_fetch_assoc($result, MYSQL_ASSOC)) {
      assert($line['name'] === 'Puffball');
  }

  mysql_select_db('live280');
  $result = mysql_query('select * from pet where name="Sophie" limit 1');
  while ($line = mysql_fetch_assoc($result, MYSQL_ASSOC)) {
      assert($line['name'] === 'Sophie');
  }

  echo '.';
}

while (true) {
  doTheThing();
}
