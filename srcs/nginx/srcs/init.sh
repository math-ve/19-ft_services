# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mvan-eyn <mvan-eyn@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/15 09:09:24 by mvan-eyn          #+#    #+#              #
#    Updated: 2020/11/15 09:10:01 by mvan-eyn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

echo "root:mvan-eyn6666@" | chpasswd

# Nginx setup
adduser -D -g 'www' www
chown -R www:www /var/lib/nginx
chown -R www:www /www

nginx -g 'pid /tmp/nginx.pid; daemon off;'