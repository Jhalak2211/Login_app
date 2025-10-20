# # Use official Python base image
# FROM python:3.11-slim

# # Set environment variables
# ENV PYTHONDONTWRITEBYTECODE=1
# ENV PYTHONUNBUFFERED=1

# # Set working directory
# WORKDIR /app

# # Install system dependencies
# RUN apt-get update && apt-get install -y libpq-dev gcc

# # Copy project files
# COPY . /app/

# # Install dependencies
# RUN pip install --upgrade pip
# RUN pip install -r requirements.txt

# # Expose port 8000
# EXPOSE 8000

# # Run Django development server
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
































FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# System dependencies for PostgreSQL
RUN apt-get update && apt-get install -y libpq-dev gcc

# Copy and install Python dependencies
COPY requirements.txt /app/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy project code
COPY . /app/

# Expose port 8000
EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
