FROM nginx:latest

# Create writable directories for Nginx temporary files
RUN mkdir -p /tmp/nginx/client_temp \
    && mkdir -p /tmp/nginx/proxy_temp \
    && mkdir -p /tmp/nginx/fcgi_temp \
    && mkdir -p /tmp/nginx/uwsgi_temp \
    && mkdir -p /tmp/nginx/scgi_temp

# Copy the Hello World app
COPY app.py /app.py

# Copy a modified Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Run the Hello World app with Nginx
CMD ["nginx", "-g", "daemon off;"]
