FROM ubuntu:xenial
# Need ubuntu <18 for libicu-dev ver. <60
# see verlihub/verlihub#170

ENV DEBIAN_FRONTEND noninteractive
ENV DESTDIR /verlihub

WORKDIR /verlihub-build

RUN apt-get update && \
 apt-get install -y wget unzip libpcre3-dev libssl-dev libmysqlclient-dev g++ libmaxminddb-dev libmaxminddb0 libicu-dev gettext libasprintf-dev make cmake python2.7-dev liblua5.2-dev libperl-dev rsync libmysqlclient20 libmaxminddb0 libicu55 libasprintf0v5 mysql-client
RUN wget https://github.com/Verlihub/verlihub/archive/1.3.0.0.zip && \
 unzip 1.3.0.0.zip && \
 cd verlihub-1.3.0.0 && mkdir -p build && cd build && \
 cmake .. && make && make install
RUN echo "/verlihub/usr/local/lib" > /etc/ld.so.conf.d/verlihub.conf && ldconfig # so not found fix
RUN rsync -avz /verlihub/* / # make isntall didnt copy, and we need bin/so/share files
CMD ["verlihub"]
EXPOSE 4111/tcp
