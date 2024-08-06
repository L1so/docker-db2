#!/bin/bash

if [[ $UID -eq 0 ]]
then
    echo "export DBNAME=$DBNAME" >> ~db2inst1/.profile
    exec su - db2inst1 -c $0
fi

init_sql=/var/tmp/init.sql

echo Running \"$init_sql\" through db2 CLI ...

. ~/.profile

db2 connect to $DBNAME
db2 -tvf $init_sql

if [ $? -ne 0 ]; then
    echo Error while running \"$init_sql\". Aborting!
    exit 1
fi

echo File \"$init_sql\" loaded successfuly ...
