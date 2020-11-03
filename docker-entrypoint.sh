#!/bin/bash
set -eu

while ! python -c "import socket;exit(socket.socket().connect_ex(('${DB_HOST}', 3306)));"; do
    echo "waiting for mysql server become available..." && sleep 1
done

cd /code
python manage.py migrate
python manage.py runserver 0.0.0.0:8000
