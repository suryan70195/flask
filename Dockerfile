# Use a minimal Python base image
FROM python:3.9-alpine

# Set working directory inside the container
WORKDIR /app

# Copy only necessary files
COPY requirements.txt .

# Install dependencies (only essential packages)
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY app.py .

# Expose port 5000
EXPOSE 5000

# Start the Flask application
CMD ["python", "app.py"]
