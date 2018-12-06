FROM skylarkelty/centos:latest
MAINTAINER "Skylar Kelty" <s.kelty@kent.ac.uk>
ADD ./shared/files/remi.repo /etc/yum.repos.d/remi.repo
ADD ./shared/files/nginx.repo /etc/yum.repos.d/nginx.repo
ADD ./shared/files/supervisord.service /etc/systemd/system/multi-user.target.wants/supervisord.service
RUN yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm \
                   nginx cronie python-setuptools \
                   && yum clean all
RUN easy_install supervisor
RUN yum-config-manager --enable remi-php72 && \
    yum install -y php72 php72-php-fpm php72-php-opcache php72-php-cli \
    php72-php-gd php72-php-pdo php72-php-xml php72-php-intl php72-php-pear \
    php72-php-soap php72-php-xmlrpc php72-php-process php72-php-mysqlnd \
    php72-php-mbstring php72-php-ldap php72-php-mcrypt \
    php72-php-pecl-memcache php72-php-pecl-memcached php72-php-pecl-zip && yum clean all
RUN ln -s /usr/bin/php72 /usr/bin/php && \
    ln -s /usr/bin/php72-cgi /usr/bin/php-cgi && \
    ln -s /usr/bin/php72-pear /usr/bin/php-pear && \
    ln -s /usr/bin/php72-phar /usr/bin/php-phar
ADD ./shared/simplesamlphp /var/www/vhosts/myfolio-dev.kent.ac.uk/sp/simplesamlphp
ADD ./shared/puppet /puppet
RUN yum install -y puppet && \
    puppet apply --modulepath=/puppet/modules /puppet/manifests/site.pp && \
    yum remove -y puppet && yum clean all
RUN date > /etc/docker-release

EXPOSE 22 80 443

CMD ["/usr/sbin/init"]
