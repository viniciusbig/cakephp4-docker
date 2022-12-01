ARG PHP_VERSION=8.1
FROM shinsenter/cakephp4:php${PHP_VERSION}

# ==========================================================

# you may want to install some PHP modules
# e.g: the following line will install imagick, pgsql, solr modules
# RUN phpaddmod imagick pgsql solr

# ==========================================================

# install CURL, SSH Client and Nano
RUN apt-get update && apt-get install -y curl openssh-client git nano

# ==========================================================

# set ENABLE_CRONTAB=true to enable crontab
ENV ENABLE_CRONTAB=true

# ==========================================================

# Install Volta and Node

# since we're starting non-interactive shell, 
# we wil need to tell bash to load .bashrc manually
ENV BASH_ENV ~/.bashrc
# needed by volta() function
ENV VOLTA_HOME /root/.volta
# make sure packages managed by volta will be in PATH
ENV PATH $VOLTA_HOME/bin:$PATH

# install volta
RUN curl https://get.volta.sh | bash

# install node LTS
RUN volta install node

# ==========================================================

# You can easily change PHP-FPM configurations
# by using pre-defined Docker's environment variables.
# Learn more: https://code.shin.company/php#customize-docker-image

# ==========================================================

WORKDIR $WEBHOME