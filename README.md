# cakephp4-docker

## Custom image

Using a [shinsenter/cakephp4](https://hub.docker.com/r/shinsenter/cakephp4) as the base image,
but we are creating a custom docker image to install dependencies not installed there

- Enable crontab (to potentially run Cake Queue)
- Install curl, ssh, git and nano
- Install node LTS (with [Volta](https://volta.sh/))
- Changing WORKDIR to point to $WEBHOME

There is a lot of variables that can be changed to customize the Docker image.
Check [shinsenter/php](https://hub.docker.com/r/shinsenter/php)

## PHP Versions

Its possible to build the image again with different PHP versions.
Just change PHP_VERSION variable to your target version.

Possible values are:

- 7.3
- 7.4
- 8.0
- 8.1
- 8.2 (beta)

[complete list here](https://hub.docker.com/r/shinsenter/php)

## Docker compose

Using docker-compose to build all necessary images for development

All configurations goes in the `.env` file. 
You can create one using `.env-sample`

- mysql:latest
- phpmyadmin/phpmyadmin
- adminer (phpmyadmin alternative)
- mailhog/mailhog
- redis:latest