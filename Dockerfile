FROM alpine:3.12.0

RUN apk update
RUN apk add g++=9.3.0-r2 make=4.3-r0 git autoconf

WORKDIR /app
