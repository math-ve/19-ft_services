# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mvan-eyn <mvan-eyn@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/09 10:53:50 by mvan-eyn          #+#    #+#              #
#    Updated: 2020/11/09 10:53:51 by mvan-eyn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

ADD		srcs/ /root

RUN		apk add openrc influxdb gettext

EXPOSE	8086

CMD [ "/bin/ash", "/root/init.sh" ]
