# Use the specified Python base image
FROM python:3.14.0a1-alpine3.20

# Set the working directory in the container
WORKDIR /usr/src/app

# Prevent Python from writing .pyc files
ENV PYTHONDONTWRITEBYTECODE=1

# Ensure Python output is sent directly to the terminal without buffering
ENV PYTHONUNBUFFERED=1

# Upgrade pip and install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /usr/src/app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt  # Use --no-cache-dir to save space

# Copy entrypoint script and give execution permission
COPY ./entrypoint.sh /usr/src/app/entrypoint.sh
RUN chmod +x /usr/src/app/entrypoint.sh  # Ensure the entrypoint script is executable

# Copy the rest of the application code
COPY . /usr/src/app/

# Set the entrypoint to the script
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
