#!/bin/bash
echo "Running collectstatic command"
python manage.py collectstatic --noinput;
echo "Running migrate command"
python manage.py migrate --no-input;