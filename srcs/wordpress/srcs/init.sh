# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mvan-eyn <mvan-eyn@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/31 13:58:35 by mvan-eyn          #+#    #+#              #
#    Updated: 2020/11/06 17:29:02 by mvan-eyn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# --- Environnement Variables
# WP_USER_PASS <- password of the wordpress mysql account

# cat << EOF > /srv/www/wordpress/wordpress/wp-config.php
# <?php
# // ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
# /** Nom de la base de données de WordPress. */
# define('DB_NAME', 'wordpress');

# /** Utilisateur de la base de données MySQL. */
# define('DB_USER', 'admin');

# /** Mot de passe de la base de données MySQL. */
# define('DB_PASSWORD', 'mvan-eyn6666@');

# /** Adresse de l’hébergement MySQL. */
# define('DB_HOST', 'svc-mariadb.default.svc.cluster.local');

# /** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
# define('DB_CHARSET', 'utf8');

# /** Type de collation de la base de données.
#   * N’y touchez que si vous savez ce que vous faites.
#   */
# define('DB_COLLATE', '');

# define( 'AUTH_KEY',         'c51783e2503cc6cea3da56f05aadd74c99c943da' );
# define( 'SECURE_AUTH_KEY',  '35806ff625e61e1c96d7d5f26431820674c47cb0' );
# define( 'LOGGED_IN_KEY',    'fd3856e84b728377add0dfc2f12132fb853210ff' );
# define( 'NONCE_KEY',        '9ed4abaf0b486f911bc34478dde91281339bfa97' );
# define( 'AUTH_SALT',        'e5593b7d543139d220a4564ede55e8c1f8cc661b' );
# define( 'SECURE_AUTH_SALT', '9997247944ee4f9940ddfcb5b3f1d450a578717c' );
# define( 'LOGGED_IN_SALT',   '19b433bf839cab7a3f4ec4d3df5c9a3589525050' );
# define( 'NONCE_SALT',       '7bdedf5928a71cf8d9385e76c361ac65b5257e17' );


# $table_prefix = 'wp_';

# define('WP_DEBUG', false);

# if ( !defined('ABSPATH') )
# 	define('ABSPATH', dirname(__FILE__) . '/');

# require_once(ABSPATH . 'wp-settings.php');
# EOF

php -S 0.0.0.0:5050 -t /srv/www/wordpress/wordpress

tail -f /dev/null
