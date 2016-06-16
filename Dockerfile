FROM ubuntu:latest
MAINTAINER bouroo <bouroo@gmail.com>

ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive

RUN locale-gen en_US.UTF-8 && locale-gen th_TH.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV TZ Asia/Bangkok

# Change root password
RUN echo "root:P@ssw0rd" | chpasswd

# Add public DNS
CMD "sh" "-c" "echo nameserver 64.6.64.6 > /etc/resolv.conf"
CMD "sh" "-c" "echo nameserver 8.8.8.8 >> /etc/resolv.conf"

# Add basic package 
RUN apt-get update && apt-get -y dist-upgrade
RUN apt-get -y install openssl software-properties-common wget curl git nano openssh-server htop zsh apt-utils supervisor

EXPOSE 22 80 443
