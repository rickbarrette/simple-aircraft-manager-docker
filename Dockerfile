FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Install system dependencies required for psycopg2
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first (better build caching)
COPY ./simple-aircraft-manager/requirements.txt .

RUN echo "psycopg2-binary==2.9.9" >> requirements.txt

# Upgrade pip and install dependencies
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy the Django project code
COPY ./simple-aircraft-manager/ .
COPY ./settings.py .

# Make the entrypoint script executable
RUN chmod +x /app/docker-entrypoint.sh

EXPOSE 8000

# Set the entrypoint to our script
ENTRYPOINT ["/app/docker-entrypoint.sh"]

# The CMD is passed to the entrypoint script as "$@"
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
