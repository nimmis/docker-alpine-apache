FROM nimmis/alpine-micro

MAINTAINER nimmis <kjell.havneskold@gmail.com>

COPY  apache2 /etc/service/apache2/run
COPY  populate /etc/run_always/ 
RUN apk update && apk upgrade && \
    apk add apache2 && \
    mkdir -p /web/html && mkdir /web/apache2 && chown -R apache.www-data /web && \
    sed -i 's#^DocumentRoot ".*#DocumentRoot "/web/html"#g' /etc/apache2/httpd.conf && \
    sed -i 's#AllowOverride none#AllowOverride All#' /etc/apache2/httpd.conf && \
    sed -i 's#^ServerRoot .*#ServerRoot /web#g'  /etc/apache2/httpd.conf && \
    sed -i 's#^IncludeOptional /etc/apache2/conf.d".*#IncludeOptional /web/config/conf.d/*.conf#g' /etc/apache2/httpd.conf && \
    sed -i 's#PidFile "/run/.*#Pidfile "/web/run/httpd.pid"#g'  /etc/apache2/conf.d/mpm.conf && \
    sed -i 's#Directory "/var/www/localhost/htdocs.*#Directory "/web/html" >#g' /etc/apache2/httpd.conf && \
    sed -i 's#Directory "/var/www/localhost/cgi-bin.*#Directory "/web/cgi-bin" >#g' /etc/apache2/httpd.conf && \
    rm -rf /var/cache/apk/*

VOLUME /web

EXPOSE 80 443

