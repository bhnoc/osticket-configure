#note: these files must remain with Unix line endings
#FROM ghcr.io/bhnoc/php8:latest

ARG REGISTRY="ghcr.io/bhnoc/"
ARG IMAGE="php8:latest"

FROM ${REGISTRY}${IMAGE}

WORKDIR /

# Copy the in-line entrypoint script
COPY app/. /var/www/html/live/.
COPY --chmod=755 <<-ENDOFLAYER /docker-entrypoint.sh
	#!/usr/bin/env bash
	set -euo pipefail -xv
	
	if [[ "\$1" == "httpd" ]];
	then
	    echo "Starting HTTPD"
	    rm -rf /run/httpd/httpd.pid
	    /usr/sbin/httpd -DFOREGROUND
	fi;
	
	exec "\$@"
ENDOFLAYER
RUN sed -i 's/\r$//' /docker-entrypoint.sh #fix potential line ending problems

RUN updatedb

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["httpd"]
