#!/bin/bash

echo "Running collectstatic command..."
python manage.py collectstatic --noinput

echo "Running migrate command..."
python manage.py migrate --no-input

echo "Starting Gunicorn..."
exec gunicorn habitmaker.wsgi:application --bind 0.0.0.0:$PORT
