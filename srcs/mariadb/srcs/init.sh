# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mvan-eyn <mvan-eyn@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/06 13:19:44 by mvan-eyn          #+#    #+#              #
#    Updated: 2020/11/09 11:15:52 by mvan-eyn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

openrc &> /dev/null
touch /run/openrc/softlevel
/etc/init.d/mariadb setup &> /dev/null
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
service mariadb restart &> /dev/null

mysql --user=root << EOF
  CREATE DATABASE wordpress;
  CREATE USER 'wp_user'@'%' IDENTIFIED BY 'mvan-eyn6666@';
  GRANT ALL ON wordpress.* TO 'wp_user'@'%' IDENTIFIED BY 'mvan-eyn6666@' WITH GRANT OPTION;
  CREATE USER 'mvan-eyn'@'%' IDENTIFIED BY 'mvan-eyn6666@';
  GRANT ALL ON *.* TO 'mvan-eyn'@'%' IDENTIFIED BY 'mvan-eyn6666@' WITH GRANT OPTION;
  FLUSH PRIVILEGES;
EOF

mysql --user=root wordpress < /root/wordpress.sql

printf "Database started !\n"

tail -F /dev/null
