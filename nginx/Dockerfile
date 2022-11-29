FROM nginx:1.23.2-alpine

RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.default

RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/nginx.conf.default


COPY nginx.conf  /etc/nginx/nginx.conf
COPY ./sites-available/* /etc/nginx/sites-available/

COPY init.sh /home

# after starting docker container for the first time, run the commands in the init.sh in the nginx container