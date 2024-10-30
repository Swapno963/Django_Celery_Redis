#!/bin/ash

set -e  # Exit immediately if a command exits with a non-zero status

echo "Applying database migrations..."
if python manage.py migrate; then
    echo "Database migrations applied successfully."
else
    echo "Failed to apply database migrations." >&2
    exit 1  # Exit with error if migrations fail
fi

echo "Collecting static files..."
if python manage.py collectstatic --noinput; then
    echo "Static files collected successfully."
else
    echo "Failed to collect static files." >&2
    exit 1  # Exit with error if collection fails
fi

echo "Starting the application..."
exec "$@"  # Execute the passed command
