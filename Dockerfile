# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set environment variables
# Set the working directory in the container
WORKDIR /app

# Prevent Python from writing pyc files to disc
ENV PYTHONDONTWRITEBYTECODE 1
# Ensure Python output is sent straight to the terminal without buffering
ENV PYTHONUNBUFFERED 1

# Install system dependencies if any (e.g., build tools) - often not needed for this app
# RUN apt-get update && apt-get install -y --no-install-recommends some-package && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on (must match Gunicorn's bind port, usually $PORT from Cloud Run)
# This is mostly documentation; Cloud Run handles the actual port mapping.
EXPOSE 8080

# Define the command to run the application using Gunicorn
# Use the PORT environment variable provided by Cloud Run
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "--workers", "4", "--threads", "2", "--timeout", "120", "app:app"]
