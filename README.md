## Alpine microcontainer with Apache2

This is a micro docker container [![](https://badge.imagelayers.io/nimmis/alpine-apache:latest.svg)](https://imagelayers.io/?images=nimmis/alpine-apache:latest) based on Alpine 3.4 and Apache version 2


### Examples

This images are build on nimmis/alpine-micro which are a modified version of Alpine with a working 
init process, and a working cron, logrotate  and syslog. Services are started with
runit daemon, for more information about that see [nimmis/alpine-mico](https://registry.hub.docker.com/u/nimmis/alpine-micro/)

#### starting the container as a daemon

	docker run -d --name apache nimmis/alpine-apache

This will start the container with apache process runnung, access the container with

	docker exec -ti apache /bin/sh

#### Static web folder

The images exposes a volume at /web. The structure below /web is

| Directory | Function |
| --------- | -------- |
| html | web root |
| cgi-bin | cgi bin folder |
| config | apache config directory |
| logs | apache log directory |

To use this start the container with

	docker run -d --name -apache -v /path/to/web:/web nimmis/alpine-apache

if the folders are missing they will be created

#### Accessing apache from outside the container

To access the webserver from external you use the -P command where the syntax is

	-P <external port on host>:<local port in container>

so to access the apache server on port 8080 you should use the command

	docker run -d --name apache -p 8080:80  nimmis/alpine-apache
