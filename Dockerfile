# Version 16.04.1
FROM ubuntu:latest
MAINTAINER bouroo <bouroo@gmail.com>

ARG	timezone=Asia/Bangkok
ENV	TERM xterm
ENV	DEBIAN_FRONTEND noninteractive

ENV	LANG en_US.UTF-8
ENV	LC_ALL en_US.UTF-8
ENV	TZ $timezone

# Change root password
RUN	echo "root:P@ssw0rd" | chpasswd

# Change locale
RUN	locale-gen en_US.UTF-8 && locale-gen th_TH.UTF-8 && \
	update-locale en_US.UTF-8 && \
	echo $timezone > /etc/timezone && \
	cp /usr/share/zoneinfo/$timezone /etc/localtime && \
	dpkg-reconfigure tzdata

# Add public DNS
RUN	echo 'nameserver 64.6.64.6' > /etc/resolv.conf && \
	echo 'nameserver 8.8.8.8' >> /etc/resolv.conf

# Add basic package 
RUN	apt update && apt -y full-upgrade
RUN	apt -y install \
		openssl \
		software-properties-common  \
		wget  \
		curl  \
		git  \
		nano  \
		openssh-server  \
		htop  \
		zsh  \
		apt-utils  \
		cron && \
	systemctl enable ssh.service

# Clean file
RUN	apt-get autoclean

RUN	sed -i "s|PermitRootLogin prohibit-password|PermitRootLogin yes|" /etc/ssh/sshd_config

COPY	./files /
RUN	chmod +x /root/entrypoint.sh

EXPOSE 22

ENTRYPOINT ["/root/entrypoint.sh"]
