node 'default'
{
    include myfolio::base
    include supervisord

    service {
        ['nginx', 'crond', 'php72-php-fpm']:
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
            target => '/data/employability/public';

        '/var/www/vhosts/myfolio-dev.kent.ac.uk/public/_sp':
            ensure => link,
            target => '/var/www/vhosts/myfolio-dev.kent.ac.uk/sp/simplesamlphp/www';

        '/etc/opt/remi/php72/php-fpm.d/www.conf':
            ensure => absent;

        '/etc/opt/remi/php72/php-fpm.d/myfolio-dev.kent.ac.uk.conf':
            ensure => present,
            source => 'puppet:///modules/webfarm/myfolio-pool.conf';
    }

    cron {
        'myfolio':
            command => '/usr/bin/php /var/www/vhosts/myfolio-dev.kent.ac.uk/public/htdocs/lib/cron.php',
            user    => 'w3myfolio',
            hour    => '*',
            minute  => '*';
    }

}
