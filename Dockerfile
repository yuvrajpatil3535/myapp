# Use a lean official Python runtime
FROM python:3.11-slim

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Create app dir
WORKDIR /app

# Install build deps then remove to keep image small
COPY requirements.txt .
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
 && pip install --no-cache-dir -r requirements.txt \
 && apt-get purge -y --auto-remove build-essential \
 && rm -rf /var/lib/apt/lists/*

# Copy app source
COPY . .

# Expose port used by the app
EXPOSE 5000

# Start app (development friendly). For production, replace with gunicorn.
CMD ["python", "app.py"]
