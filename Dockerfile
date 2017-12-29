FROM alpine:latest
RUN apk add --update asterisk asterisk-speex asterisk-sample-config asterisk-curl asterisk-srtp asterisk-sounds-en asterisk-sounds-moh
ADD users.conf /tmp/users.conf
RUN cat /tmp/users.conf >> /etc/asterisk/users.conf
ADD extensions.conf /tmp/extensions.conf
RUN cat /tmp/extensions.conf >> /etc/asterisk/extensions.conf
RUN rm /tmp/*.conf
EXPOSE 5060
EXPOSE 10000-20000
CMD ["/usr/sbin/asterisk", "-vvvdddf", "-T", "-W", "-U", "root", "-p"]
