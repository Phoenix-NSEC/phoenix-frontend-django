#!/bin/sh
if [ "$DJANGO_DEBUG" = "True" ]; 
then
    echo "Running Development Server"
    gunicorn main.wsgi -w 2 --bind :8000 --reload
else
    echo "Running Production Server"
    python manage.py collectstatic --noinput
    python manage.py makemigrations
    python manage.py migrate
    gunicorn main.wsgi -w 2 --bind :8000
fi
