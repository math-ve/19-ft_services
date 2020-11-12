# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mvan-eyn <mvan-eyn@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/12 08:58:57 by mvan-eyn          #+#    #+#              #
#    Updated: 2020/11/12 08:59:00 by mvan-eyn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

ADD		srcs/ /root/

RUN		mkdir -p /srv/www/wordpress

RUN		apk add wget php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN		wget http://fr.wordpress.org/latest-fr_FR.tar.gz -P /tmp	\
		&& tar xzf /tmp/latest-fr_FR.tar.gz -C /srv/www/wordpress

COPY	srcs/wp-config.php /srv/www/wordpress

EXPOSE	5050

CMD		[ "/bin/ash", "/root/init.sh" ]
