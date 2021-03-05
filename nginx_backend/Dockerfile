# Base on offical NGINX 1.18 image
FROM nginx:1.18

# Remove any existing config files
RUN rm /etc/nginx/conf.d/*

# Copy config files
# *.conf files in conf.d/ dir get included in main config
COPY ./*.conf /etc/nginx/conf.d/

# Create backend static/media root directories
# and they're owned by backend uid/gid (1000)
RUN mkdir -p /home/backend/public/static \
    && mkdir -p /home/backend/public/media \
    && chown -R 1000:1000 /home/backend

# Expose the listening port
EXPOSE 8765

# Launch NGINX
CMD [ "nginx", "-g", "daemon off;" ]