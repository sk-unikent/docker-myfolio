<?php
/**
 * SAML 2.0 remote SP metadata for simpleSAMLphp.
 *
 * See: http://simplesamlphp.org/docs/trunk/simplesamlphp-reference-sp-remote
 */

$metadata['localhost'] = array(
	'AssertionConsumerService' => 'http://localhost:8081/simplesaml/module.php/saml/sp/saml2-acs.php/default-sp',
	'SingleLogoutService' => 'http://localhost:8081/simplesaml/module.php/saml/sp/saml2-logout.php/default-sp',
);

$metadata['myfolio-dev'] = array(
	'AssertionConsumerService' => 'http://myfolio-dev.kent.ac.uk/simplesaml/module.php/saml/sp/saml2-acs.php/default-sp',
	'SingleLogoutService' => 'http://myfolio-dev.kent.ac.uk/simplesaml/module.php/saml/sp/saml2-logout.php/default-sp',
);

$metadata['kar-dev'] = array(
    'AssertionConsumerService' => 'http://kar.dev/mellon/postResponse',
    'SingleLogoutService' => 'http://kar.dev/mellon/logout',
);