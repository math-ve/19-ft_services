# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mvan-eyn <mvan-eyn@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/11 14:49:21 by mvan-eyn          #+#    #+#              #
#    Updated: 2020/11/11 14:49:23 by mvan-eyn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

RUN apk update && \
    apk upgrade && \
    apk add --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ pure-ftpd && \
    apk add openssl curl

RUN adduser -D -h /home/mvan-eyn mvan-eyn && \
    echo -e 'mvan-eyn6666@\nmvan-eyn6666@' | passwd mvan-eyn && \
    echo -e 'mvan-eyn6666@\nmvan-eyn6666@' | pure-pw useradd mvan-eyn -u mvan-eyn -g mvan-eyn -d /home/mvan-eyn

RUN openssl req -x509 -nodes -days 7300 -subj "/C=BE/ST=BX/L=Belgique/O=19/CN=mvan-eyn" \
    -newkey rsa:2048 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

EXPOSE 21
EXPOSE 21000
EXPOSE 21001
EXPOSE 21002
EXPOSE 21003
EXPOSE 21004
EXPOSE 21005

CMD "/entrypoint.sh"
