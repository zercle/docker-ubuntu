# Ubuntu 16.04.3
FROM ubuntu:latest
MAINTAINER kawin <kawinv@zercle.technology>

ARG	timezone=Asia/Bangkok
ENV	TERM xterm
ENV	DEBIAN_FRONTEND noninteractive

ENV	LANG en_US.UTF-8
ENV	LC_ALL en_US.UTF-8
ENV	TZ $timezone

# Change locale
RUN apt update && apt -y install locales tzdata \
	&& locale-gen en_US.UTF-8 && locale-gen th_TH.UTF-8 \
	&& update-locale en_US.UTF-8 \
	&& echo $timezone > /etc/timezone \
	&& cp /usr/share/zoneinfo/$timezone /etc/localtime \
	&& dpkg-reconfigure tzdata

# Add basic package 
RUN	apt update && apt -y full-upgrade
RUN	apt -y install \
		openssl \
		net-tools \
		software-properties-common \
		wget \
		curl \
		git \
		nano \
		htop \
		zsh \
		apt-utils \
		iputils-ping \
		traceroute \
		dnsutils \
		genisoimage \
		cron \
		unattended-upgrades \
		apt-transport-https \
		pwgen

# Clean file
RUN	apt-get autoclean

RUN echo 'APT::Periodic::Update-Package-Lists "1";' > /etc/apt/apt.conf.d/20auto-upgrades \
	&& echo 'APT::Periodic::Unattended-Upgrade "1";' >> /etc/apt/apt.conf.d/20auto-upgrades \

COPY	./files /
RUN	chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
