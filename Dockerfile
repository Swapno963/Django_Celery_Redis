# Dockerfile

FROM python:3.8  

# Set working directory
WORKDIR /usr/src/app

# Install system dependencies
RUN apt-get update && \
    apt-get install -y libpq-dev gcc && \
    rm -rf /var/lib/apt/lists/*

# Upgrade pip and install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /usr/src/app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt  # Use --no-cache-dir to save space

# Copy entrypoint script and give execution permission
COPY ./entrypoint.sh /usr/src/app/entrypoint.sh
RUN chmod +x /usr/src/app/entrypoint.sh  # Ensure the entrypoint script is executable

# Copy project files
COPY . .


# Command to run Django server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
