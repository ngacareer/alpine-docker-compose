# Developer: TriuHv <ms@ngacareer.com>
#
# GitHub:   https://github.com/ngacareer
# Twitter:  https://twitter.com/ngacareer
# Docker:   https://hub.docker.com/ngacareer
# Facebook: https://facebook.com/ngacareer 
# Linkedin: https://www.linkedin.com/in/ngacareer/
# website:  https://ngacareer.com

FROM ngacareer/alpine-curl

LABEL maintainer="triuhv <ms@ngacareer.com>" \
    architecture="amd64/x86_64" \
    docker-version="20.10.3" \
    alpine-version="3.13" \
    build="03-Mar-2021"

RUN apk upgrade --no-cache --update && \
    apk add py-pip

ENV DOCKER_VERSION ${DOCKER_VERSION:-20.10.3}

RUN curl -o docker.tgz -L \
    https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz

RUN set -eux; \
	tar --extract \
		--file docker.tgz \
		--strip-components 1 \
		--directory /usr/local/bin/ \
	; \
	rm docker.tgz; \
	\
	dockerd --version; \
	docker --version
	
RUN pip install docker-compose	&& docker-compose -v

COPY modprobe.sh /usr/local/bin/modprobe 
COPY docker-entrypoint.sh /usr/local/bin/ 
ENTRYPOINT ["/sbin/tini", "--", "docker-entrypoint.sh", "entrypoint.sh"]
