define webfarm::base::vhost($vhost = $title, $owner = 'w3admin', $writeable = 'w3myfolio') {
    file {
        "/var/www/vhosts/${vhost}":
            ensure => directory,
            require => File['/var/www/vhosts'],
            owner => $owner;

        "/var/www/vhosts/${vhost}/writable":
            ensure => directory,
            require => File["/var/www/vhosts/${vhost}"],
            owner => $owner;

        "/var/www/vhosts/${vhost}/public":
            ensure => directory,
            owner => $owner,
            replace => false;

        [
            "/var/www/vhosts/${vhost}/writable/sessions",
            "/var/www/vhosts/${vhost}/writable/wsdlcache",
            "/var/www/vhosts/${vhost}/writable/logs",
            "/var/www/vhosts/${vhost}/writable/cache",
            "/var/www/vhosts/${vhost}/writable/cache/myfolio",
            "/var/www/vhosts/${vhost}/writable/cache/eps",
            "/var/www/vhosts/${vhost}/writable/data"
        ]:
            ensure => directory,
            require => File["/var/www/vhosts/${vhost}/writable"],
            owner => $writeable;
    }
}
