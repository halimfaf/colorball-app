FROM --platform=amd64 nginx:mainline-alpine 
RUN rm /etc/nginx/conf.d/*

ADD html /usr/share/nginx/html
ADD img /usr/share/nginx/html/img

ADD default.conf /default.conf
ENV COLOR_SERVER1=127.0.0.1:8015 COLOR_SERVER2=127.0.0.2:8015 COLOR_SERVER3=127.0.0.3:8015 COLOR_CODE=red QUOTE=$

ADD super-handler.sh /
RUN chmod +x /super-handler.sh
ENTRYPOINT ["/bin/sh" , "-c" , " sh super-handler.sh && exec nginx -g 'daemon off;'"]
