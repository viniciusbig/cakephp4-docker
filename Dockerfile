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
# ENV BASH_ENV ~/.bashrc
# needed by volta() function
# ENV VOLTA_HOME /root/.volta
# make sure packages managed by volta will be in PATH
# ENV PATH $VOLTA_HOME/bin:$PATH
# install volta
# RUN curl https://get.volta.sh | bash
# install node LTS
# RUN volta install node

# VOLTA is not available for MAC M1, so we need to install node manually
# Install NVM
# RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
# RUN source ~/.bashrc
# # install NODE LTS (hydrogen)
# RUN nvm install lts/hydrogen

# https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04
# https://github.com/creationix/nvm#install-script
ENV NODE_VERSION lts/hydrogen

RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.39.3/install.sh | bash
ENV NVM_DIR="$HOME/.nvm"
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# ==========================================================

# Install AWS CLI

# Choose the correct architecture. For M1, you should choose ARM
# RUN	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
RUN	unzip awscliv2.zip && ./aws/install

# ==========================================================

# You can easily change PHP-FPM configurations
# by using pre-defined Docker's environment variables.
# Learn more: https://code.shin.company/php#customize-docker-image
