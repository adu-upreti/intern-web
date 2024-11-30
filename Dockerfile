# Use the latest Python image as the base
FROM python:3.11-slim

# Install Node.js, npm, and Git
RUN apt-get update && apt-get install -y \
    nodejs \
    npm \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the project files into the container (ensure the full project is copied)
COPY . .

# Install Django
RUN pip install --upgrade pip && pip install django

# Check versions for verification
RUN node -v && npm -v && python --version && git --version && django-admin --version

# Expose the default Django port
EXPOSE 8000

# Command to run Django's development server (update path to 'skillspark/manage.py')
CMD ["python", "skillspark/manage.py", "runserver", "0.0.0.0:8000"]

