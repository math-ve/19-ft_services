# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mvan-eyn <mvan-eyn@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/06 13:20:40 by mvan-eyn          #+#    #+#              #
#    Updated: 2020/11/06 18:34:34 by mvan-eyn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN		apk add mariadb mariadb-client openrc

ADD		srcs/ /root

EXPOSE	3306

CMD		[ "/bin/ash", "/root/init.sh" ]
