FROM ubuntu:16.04
MAINTAINER Nhat Nguyen 


ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8

## Install php nginx mysql supervisor
RUN apt-get update && apt-get install language-pack-en python-software-properties  software-properties-common -y && \
	add-apt-repository ppa:ondrej/php && apt update && \
    apt install -y  php5.6-fpm php5.6-mysql php5.6-gd php5.6-intl php5.6-xsl php5.6-mcrypt php5.6-mysql php5.6-curl \
                    php5.6-xml php5.6-mbstring php5.6-zip php5.6-sybase\
                    freetds-common freetds-bin unixodbc  \
                    nginx \
                    curl \                    
                    npm  make libpng-dev\
			        zip nodejs\
                    supervisor && \   
                    rm -rf /var/lib/apt/lists/*

## Configuration
RUN sed -i 's/^listen\s*=.*$/listen = 127.0.0.1:9000/' /etc/php/5.6/fpm/pool.d/www.conf && \
    sed -i 's/^\;error_log\s*=\s*syslog\s*$/error_log = \/var\/log\/php\/cgi.log/' /etc/php/5.6/fpm/php.ini && \
    sed -i 's/^\;error_log\s*=\s*syslog\s*$/error_log = \/var\/log\/php\/cli.log/' /etc/php/5.6/cli/php.ini 

COPY files/root /

# Install composer
RUN curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer;

WORKDIR /var/www/

VOLUME /var/www/

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
