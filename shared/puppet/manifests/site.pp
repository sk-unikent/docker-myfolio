node 'default'
{
    include myfolio::base

    service {
        ['nginx', 'crond', 'php56-php-fpm']:
            enable => true;
    }

    file {
        '/etc/nginx/conf.d/default.conf':
            ensure => absent;

        '/etc/nginx/conf.d/myfolio-dev.kent.ac.uk.conf':
            ensure => present,
            source => 'puppet:///modules/webfarm/myfolio-dev.kent.ac.uk.conf';

        '/var/www/vhosts/myfolio-dev.kent.ac.uk/public/myfolio':
            ensure => link,
            target => '/data/myfolio/htdocs';

        '/var/www/vhosts/myfolio-dev.kent.ac.uk/public/employability':
            ensure => link,
            target => '/data/eps/public';

        '/var/www/vhosts/myfolio-dev.kent.ac.uk/public/_sp':
            ensure => link,
            target => '/var/www/vhosts/myfolio-dev.kent.ac.uk/sp/simplesamlphp/www';

        '/opt/remi/php56/root/etc/php-fpm.d/www.conf':
            ensure => absent;

        '/opt/remi/php56/root/etc/php-fpm.d/myfolio-dev.kent.ac.uk.conf':
            ensure => present,
            source => 'puppet:///modules/webfarm/myfolio-pool.conf';
    }
}
