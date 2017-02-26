FROM alpine

RUN apk update \
        && apk add --no-cache \
                curl

COPY /eve.sh /eve.sh
