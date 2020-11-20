# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mvan-eyn <mvan-eyn@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/31 13:58:35 by mvan-eyn          #+#    #+#              #
#    Updated: 2020/11/13 16:22:01 by mvan-eyn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#php -S 0.0.0.0:5050 -t /srv/www/wordpress/wordpress

php-fpm7&
nginx -g 'pid /tmp/nginx.pid; daemon off;'