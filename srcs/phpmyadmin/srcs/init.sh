# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mvan-eyn <mvan-eyn@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/02 16:13:43 by mvan-eyn          #+#    #+#              #
#    Updated: 2020/11/02 16:13:45 by mvan-eyn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

php -S 0.0.0.0:5000 -t /srv/www/phpmyadmin

tail -f /dev/null
