<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'mvan-eyn' );

/** MySQL database password */
define( 'DB_PASSWORD', 'mvan-eyn6666@' );

/** MySQL hostname */
define( 'DB_HOST', 'svc-mariadb.default.svc.cluster.local' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'c51783e2503cc6cea3da56f05aadd74c99c943da' );
define( 'SECURE_AUTH_KEY',  '35806ff625e61e1c96d7d5f26431820674c47cb0' );
define( 'LOGGED_IN_KEY',    'fd3856e84b728377add0dfc2f12132fb853210ff' );
define( 'NONCE_KEY',        '9ed4abaf0b486f911bc34478dde91281339bfa97' );
define( 'AUTH_SALT',        'e5593b7d543139d220a4564ede55e8c1f8cc661b' );
define( 'SECURE_AUTH_SALT', '9997247944ee4f9940ddfcb5b3f1d450a578717c' );
define( 'LOGGED_IN_SALT',   '19b433bf839cab7a3f4ec4d3df5c9a3589525050' );
define( 'NONCE_SALT',       '7bdedf5928a71cf8d9385e76c361ac65b5257e17' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );
define('WP_ALLOW_REPAIR', true);

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
