FROM fedora:34 as php-dbus
RUN dnf -y install bash php-common php-devel php-cli go gcc
RUN dnf -y install gcc automake autoconf
RUN dnf -y install dbus-glib-devel dbus-devel
RUN dnf -y install dbus-tools dbus-daemon
RUN dnf -y install procps-ng net-tools tmux
RUN dnf -y install socat pv


WORKDIR /pecl-dbus
COPY *.m4 *.c *.h *.xml /pecl-dbus/
RUN phpize
RUN ./configure
RUN make -j

RUN make test

RUN ls /pecl-dbus/modules/*.so

RUN php -v
RUN ls /usr/lib64/php/modules/*.so
RUN cp /pecl-dbus/modules/dbus.so /usr/lib64/php/modules/dbus.so
COPY 99-dbus.ini /etc/php.d/99-dbus.ini
RUN sh -c "php -i|grep '^Dbus support => enabled'"



ADD ./examples /examples
WORKDIR /examples


EXPOSE 49225
ENV PORT=49225
ENV SOCK=/run/dbus/system_bus_socket
ENV DBUS_SESSION_BUS_ADDRESS=unix:path=/run/dbus/system_bus_socket
COPY container-socat.sh /socat.sh
RUN chmod +x /socat.sh



