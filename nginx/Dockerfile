FROM nginx:1.23.2-alpine

RUN mv /etc/nginx/nginx.conf   /etc/nginx/nginxMain.conf

COPY nginx.conf  /etc/nginx/nginx.conf
COPY ./sites-available/site.conf/  /etc/nginx/conf.d