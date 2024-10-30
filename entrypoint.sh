#!/bin/ash

echo "Applying database migrations..."
python manage.py migrate  # Fixed the command from 'migrations' to 'migrate'

echo "Collecting static files..."
python manage.py collectstatic --noinput  # Optional: only if you need static files

echo "Starting the application..."
exec "$@"  # Added a space between exec and "$@"
