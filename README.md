# docker-ubuntu
Ubuntu with basic packages base for other docker

# packages
openssl
software-properties-common
wget
curl
git
nano
openssh-server
htop
zsh
apt-utils
supervisor

# user pass
root:P@ssw0rd

## Run

	docker run -d \
	--restart=always \
	-h ubuntu \
	--name ubuntu \
	zercle/docker-ubuntu
