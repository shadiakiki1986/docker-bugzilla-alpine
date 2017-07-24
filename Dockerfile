# https://hub.docker.com/_/nginx/
# https://github.com/nginxinc/docker-nginx/blob/master/stable/alpine-perl/
FROM nginx:alpine-perl

WORKDIR /usr/share/nginx/html/
RUN  apk add --update wget \
  && wget --no-check-certificate https://ftp.mozilla.org/pub/mozilla.org/webtools/bugzilla-5.0.3.tar.gz \
  && tar -xzf bugzilla-5.0.3.tar.gz \
  && rm bugzilla-5.0.3.tar.gz

RUN apk add --update \
      perl-appconfig perl-date-calc perl-template-toolkit perl-mime-tools perl-datetime perl-datetime-timezone perl-email-mime \
      perl-dbi perl-dbd-mysql perl-cgi perl-xml-twig perl-gdgraph perl-html-scrubber perl-test-taint perl-file-slurp perl-module-build \
      perl-ldap perl-file-which perl-authen-sasl perl-template-toolkit-doc perl-html-formattext-withlinks perl-gd \
      mysql-client mariadb-dev \
      gcc make openssl-dev perl-dev

# http://www.webopius.com/content/231/how-to-get-bugzilla-working-with-the-nginx-web-server
RUN /etc/init.d/nginx start

WORKDIR /usr/share/nginx/html/bugzilla-5.0.3
RUN perl install-module.pl --all
RUN perl checksetup.pl

# https://github.com/nginxinc/docker-nginx/blob/master/stable/alpine-perl/nginx.conf
COPY nginx-bugzilla.conf /etc/nginx/conf.d/

# https://hub.docker.com/r/dklawren/docker-bugzilla/~/dockerfile/
# ...
