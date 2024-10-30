FROM python:3.14.0a1-alpine3.20

WORKDIR /usr/src/app

# Prevent python from wrting .pyc files
ENV PYTHONDONTWRITEBYTECODE 1

# Ensure python output is send directly to the terminal without buffering
ENV PYTHONUNBUFFERED 1
