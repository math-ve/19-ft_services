# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mvan-eyn <mvan-eyn@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/09 11:14:56 by mvan-eyn          #+#    #+#              #
#    Updated: 2020/11/09 11:14:58 by mvan-eyn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# docker run -it -p 5000:5000 --network="bridge" -e MYSQL_IP="172.17.0.2" pma_srv

FROM	alpine

ADD		srcs/ /root/

RUN		apk add wget php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN		mkdir -p /srv/www/ \
		&& wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz -P /tmp \
		&& tar zxf /tmp/phpMyAdmin-5.0.2-all-languages.tar.gz -C /tmp \
		&& mv /tmp/phpMyAdmin-5.0.2-all-languages /srv/www/ \
		&& mv /srv/www/phpMyAdmin-5.0.2-all-languages /srv/www/phpmyadmin \
		&& mv /root/config.inc.php /srv/www/phpmyadmin

EXPOSE	5000

CMD		[ "/bin/ash", "/root/init.sh" ]
