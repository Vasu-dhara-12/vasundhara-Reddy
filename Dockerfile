# Dockerfile
FROM nginx:alpine

# Remove default NGINX website
RUN rm -rf /usr/share/nginx/html/*

# Copy your static site files
COPY . /usr/share/nginx/html

# Expose port 4000
EXPOSE 4000

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
