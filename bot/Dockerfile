# Based on official Python 3.8
FROM python:3.8

# Run container as non-root (unprivileged) user
# Create new user: appuser
RUN groupadd -g 1001 appuser \
    && useradd -r -m -d /home/appuser/ -u 1001 -g appuser appuser \
    && chown -R appuser /home/appuser/

# Create data folders
RUN mkdir /etc/.data \
    && mkdir /etc/.data/dropped_items \
    && mkdir /etc/.data/game_list \
    && mkdir /etc/.data/logs \
    && mkdir /etc/.data/scraped_items \
    && chown -R appuser /etc/.data

USER appuser

# Add user .local/bin in PATH
ENV PATH=/home/appuser/.local/bin:$PATH

# Set environment variable for app
ENV SCRAPY_SETTINGS_MODULE=cgdb_bot.settings
ENV DATA_ROOT=/etc/.data

# Create working directory
RUN mkdir /home/appuser/app
WORKDIR /home/appuser/app

# Copy requirements.txt and install dependencies before other files
# Utilise Docker cache to save re-installing dependencies if unchanged
COPY --chown=appuser:appuser ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

# Copy all source files
COPY --chown=appuser:appuser ./src ./
