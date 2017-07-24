# https://hub.docker.com/_/nginx/
# https://github.com/nginxinc/docker-nginx/blob/master/stable/alpine-perl/
FROM nginx:alpine-perl

RUN  apk add --update wget \
  && cd /usr/share \
  && mkdir bugzilla \
  && wget --no-check-certificate https://ftp.mozilla.org/pub/mozilla.org/webtools/bugzilla-5.0.3.tar.gz

# https://github.com/nginxinc/docker-nginx/blob/master/stable/alpine-perl/nginx.conf
COPY nginx-bugzilla.conf /etc/nginx/conf.d/

# https://hub.docker.com/r/dklawren/docker-bugzilla/~/dockerfile/
# ...
