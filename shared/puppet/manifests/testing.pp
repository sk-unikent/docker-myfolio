node 'default'
{
    include myfolio::base

    file {
        '/var/www/vhosts/myfolio-dev.kent.ac.uk/public/testing':
            ensure => link,
            target => '/data';

        '/var/www/vhosts/myfolio-dev.kent.ac.uk/writable/data/testing':
            ensure => directory,
            require => File['/var/www/vhosts/myfolio-dev.kent.ac.uk/writable/data'];
    }
}
