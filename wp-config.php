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
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'mysql');

/** MySQL hostname */
define('DB_HOST', '127.0.0.1');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'gHk;C2Tpmf9~t5O)dm]:^2a;C54Jj%A/5K?[>MDVx;n4;wZ}XHTR:d!8;x3YQL00');
define('SECURE_AUTH_KEY',  '[g!e3U Siv,sWJV,D`Ob]mbs1u 3N4hNDt767W}]<Y>as_DPd2v.[j[E9%Lo+t6!');
define('LOGGED_IN_KEY',    '=?Ik$^U>8?dbxYbN+R5!q0)Eyzfk{:!SEC*f8:ZW1aKpSKA8=$02#.C#QDi^7E8A');
define('NONCE_KEY',        '?7-G_3wb2KFBrqBJ@}&B2avFfQA?T+874`FK/<v;GTdk3^59b;nb9bvb.[FV@@Mm');
define('AUTH_SALT',        ',-;BZqbb-AKnAt9t46cnuV( k4>@2~Vcm<yA{nG#5B>#r|7n6tWg}v;^_X$C%=2}');
define('SECURE_AUTH_SALT', 'ztgT%L ~dUV8q^`[8kb1<)bzR(f7@B_xS!Th*}pU>5^GQ;F&jD.;^+KS$*`P@AtA');
define('LOGGED_IN_SALT',   'kp)YD!X8ul8}H!T5|4mg/y%O]e!cy9)i/7-kS.JakwWL;t #cJ42)/,a%gEZGpoW');
define('NONCE_SALT',       'SFQ<bS9nTKx*~}-u:L%Vn0ef9QQ_/+tK3cB~I)?[1WK;oH?$u]yFt)hr8qx}uwjz');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
