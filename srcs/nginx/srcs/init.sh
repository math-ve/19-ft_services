# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mvan-eyn <mvan-eyn@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/07 10:18:11 by mvan-eyn          #+#    #+#              #
#    Updated: 2020/11/08 17:37:13 by mvan-eyn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

echo "root:mvan-eyn6666@" | chpasswd

# Creating SSL keys
#openssl req -x509 -nodes -subj '/CN=192.168.99.232' -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt
# PAS SAVE LORS DU DENRIER FONCTIONNEMENT


# Nginx setup
adduser -D -g 'www' www
chown -R www:www /var/lib/nginx
chown -R www:www /www

# Nginx & SSH starting
openrc
touch /run/openrc/softlevel
service nginx start
service sshd start

tail -F /dev/null
