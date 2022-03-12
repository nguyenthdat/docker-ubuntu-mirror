FROM alpine:3.10
RUN apk --no-cache add perl wget git gzip && \
    git clone https://github.com/apt-mirror/apt-mirror.git /tmp && \
    cp /tmp/apt-mirror /usr/bin
RUN apk update && apk add bash
WORKDIR /aptmirror
COPY . .
VOLUME ["/aptmirror"]
CMD ["/bin/bash", "cnf.sh"]
CMD ["/bin/bash", "entrypoint.sh"]
