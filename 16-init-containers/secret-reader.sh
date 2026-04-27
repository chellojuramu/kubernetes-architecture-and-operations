#!/bin/bash

# 1. check location exist or not
# 2. if exist, read it and export it. then call the mysql entrypoint script
# 3. if it does not exist throw the error

if [ -f /secrets/mysql-secret-reader.txt ]; then
    PASSWORD=$(cat /secrets/mysql-secret-reader.txt)
    echo "Password accessed successfully"
else
    echo "Cant find the secret file"
    exit 1
fi

export MYSQL_ROOT_PASSWORD=$PASSWORD
rm /secrets/mysql-secret-reader.txt
exec /usr/local/bin/docker-entrypoint.sh mysqld