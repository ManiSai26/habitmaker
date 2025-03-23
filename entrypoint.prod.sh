#!/bin/bash
echo "Running collectstatic command"
python manage.py collectstatic --noinput;
echo "Running migrate command"
python manage.py migrate --no-input;
exec gunicorn habitmaker.wsgi:application --bind 0.0.0.0:$PORT