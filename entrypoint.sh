#!/bin/bash
set -e

python manage.py migrate --noinput
python manage.py collectstatic --noinput
gunicorn ${WSGI_MODULE:-config.wsgi}:application --bind 0.0.0.0:8000 --workers 3
