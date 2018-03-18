FROM paperworkco/paperplane:latest

RUN apk update \
 && apk add curl unzip wget nginx nginx-mod-stream \
 && rm -rf /var/cache/apk/*

# add ContainerPilot configuration
COPY containerpilot.json5 /etc/containerpilot.json5
COPY containerpilot.sh /usr/local/bin/
RUN chmod 500 /usr/local/bin/containerpilot.sh

# add Nginx virtualhost configuration
COPY nginx.conf /etc/nginx/nginx.conf

# add Nginx virtualhost template that we'll overwrite
COPY nginx.conf.tmpl /etc/nginx.conf.tmpl

EXPOSE 8000 8443 8001 8444

ENTRYPOINT []
CMD ["containerpilot"]
