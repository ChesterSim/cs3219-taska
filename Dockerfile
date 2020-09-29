FROM nginx

# Deletes the existing deafult.conf file in image
RUN rm /etc/nginx/conf.d/default.conf

# Copies local default.conf into image
COPY default.conf /etc/nginx/conf.d/

# Copies html directory into image
COPY html /usr/share/nginx/html
