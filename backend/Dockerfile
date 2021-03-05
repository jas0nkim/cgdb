# Based on official Python 3.8
FROM python:3.8

# Install netcat
RUN apt-get update \
    && apt-get -y dist-upgrade \
    && apt install -y netcat

# Run container as non-root (unprivileged) user
# Create new user: appuser
RUN groupadd -g 1000 appuser \
    && useradd -r -m -d /home/appuser/ -u 1000 -g appuser appuser \
    && chown -R appuser /home/appuser/
USER appuser

# Create django static/media root directories
RUN mkdir -p /home/appuser/public/static
RUN mkdir -p /home/appuser/public/media

# Add user .local/bin in PATH
ENV PATH=/home/appuser/.local/bin:$PATH

# Set environment variable for app
ENV DJANGO_SETTINGS_MODULE=cgdb.settings
ENV PYTHONUNBUFFERED=1

# Create working directory
RUN mkdir /home/appuser/app
WORKDIR /home/appuser/app

# Copy requirements.txt and install dependencies before other files
# Utilise Docker cache to save re-installing dependencies if unchanged
COPY --chown=appuser:appuser ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

# Copy all source files
COPY --chown=appuser:appuser ./src ./

# Expose app port
EXPOSE 8000

# Run entrypoint.sh script when container starts
ENTRYPOINT [ "/home/appuser/app/entrypoint.sh" ]