#!/bin/sh

echo "Running migrations..."
python manage.py migrate

echo "Starting Gunicorn server..."
gunicorn auth_project.wsgi:application --bind 0.0.0.0:8000
