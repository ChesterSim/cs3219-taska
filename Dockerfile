FROM nginx
COPY html /usr/share/nginx/html

CMD echo "The Docker container is running now!"