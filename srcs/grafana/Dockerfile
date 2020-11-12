# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mvan-eyn <mvan-eyn@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/06 12:46:35 by mvan-eyn          #+#    #+#              #
#    Updated: 2020/11/09 10:48:12 by mvan-eyn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

ADD		srcs /root

# Fix libc dependency to run the grafana binary
RUN		mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

# --- Grafana Installation
# Download
RUN		cd /tmp \
		&& wget https://dl.grafana.com/oss/release/grafana-7.1.5.linux-amd64.tar.gz \
		&& tar -zxvf grafana-7.1.5.linux-amd64.tar.gz \
		&& mv grafana-7.1.5 grafana \
		&& mv grafana /root \
		&& mv /root/datasources.yaml /root/grafana/conf/provisioning/datasources \
		&& mv /root/dashboard.yaml /root/grafana/conf/provisioning/dashboards \
		&& mv /root/dashboard.json /root/grafana/conf/provisioning/dashboards \
		&& apk add curl

# Installation
RUN		ln -s /root/grafana/bin/grafana-cli /usr/bin \
		&& ln -s /root/grafana/bin/grafana-server /usr/bin
	
VOLUME	[ "/root/grafana/data" ]

EXPOSE	3000

CMD		[ "/bin/ash", "/root/init.sh" ]
