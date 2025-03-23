FROM python:3.12.4-bookworm

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Create and set working directory
RUN mkdir -p /home/app
ENV HOME=/home/app
ENV APP_HOME=/home/app/web
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends netcat-traditional dos2unix

# Upgrade pip
RUN pip install --upgrade pip

# Copy and install dependencies first for better caching
COPY ./requirements.txt $APP_HOME/
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY . $APP_HOME/

# Fix permissions for entrypoint
COPY ./entrypoint.prod.sh /entrypoint.prod.sh
RUN dos2unix /entrypoint.prod.sh && chmod +x /entrypoint.prod.sh

# Expose port
EXPOSE 8000
ENV PORT=8000

# Run entrypoint script
ENTRYPOINT ["/entrypoint.prod.sh"]
