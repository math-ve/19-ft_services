# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mvan-eyn <mvan-eyn@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/07 10:14:29 by mvan-eyn          #+#    #+#              #
#    Updated: 2020/11/08 17:14:36 by mvan-eyn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

# Set workdir
RUN		mkdir /tmp/ft_services_payload /www
ADD		srcs/ /tmp/ft_services_payload
WORKDIR	/tmp/ft_services_payload

# Install core services
RUN		apk add openrc nginx openssl openssh

# Moving necessary files
ADD		srcs/nginx.conf /etc/nginx/
ADD		srcs/sshd_config /etc/ssh/
ADD		www/index.html /www

# Test
COPY    srcs/server.crt /etc/ssl/certs/server.crt
COPY    srcs/server.key /etc/ssl/private/server.key

EXPOSE	80 443 22

CMD [ "/bin/ash", "/tmp/ft_services_payload/init.sh" ]
