# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mvan-eyn <mvan-eyn@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/06 12:51:12 by mvan-eyn          #+#    #+#              #
#    Updated: 2020/11/06 12:51:13 by mvan-eyn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

telegraf --config /root/telegraf.conf

tail -f /dev/null