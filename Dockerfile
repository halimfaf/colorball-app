FROM nginx:mainline-alpine
RUN rm /etc/nginx/conf.d/*

ADD html /usr/share/nginx/html
ADD img /usr/share/nginx/html/img

ADD default.conf /default.conf
ENV COLOR_CODE red
ENV QUOTE $

ADD super-handler.sh /
RUN chmod +x /super-handler.sh
ENTRYPOINT ["/bin/sh" , "-c" , " sh super-handler.sh && exec nginx -g 'daemon off;'"]
