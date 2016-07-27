class myfolio::base {
    group {
        'pkg':
            ensure => 'present';
    }

    user {
        ['w3myfolio', 'w3admin']:
            ensure => 'present',
            managehome => true,
            groups => ['pkg'],
            require => Group['pkg'];
    }

    class {
        'webfarm::base': ;
    }

    webfarm::base::vhost {
        'myfolio-dev.kent.ac.uk': ;
    }
}
