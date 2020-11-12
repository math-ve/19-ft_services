# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mvan-eyn <mvan-eyn@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/09 09:06:46 by mvan-eyn          #+#    #+#              #
#    Updated: 2020/11/09 10:54:58 by mvan-eyn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

openrc
touch /run/openrc/softlevel
service influxdb start 
sleep 2
influx << EOF
CREATE USER mvan-eyn WITH PASSWORD 'mvan-eyn6666@' WITH ALL PRIVILEGES;
CREATE DATABASE telegraf;
CREATE USER user_telegraf WITH PASSWORD 'mvan-eyn6666@';
GRANT ALL ON telegraf TO user_telegraf;
EOF

tail -f /dev/null
