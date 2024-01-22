FROM node:21-alpine

RUN npm i -g --force yarn pnpm

RUN  echo 'http://dl-cdn.alpinelinux.org/alpine/v3.5/main' > /etc/apk/repositories \
    && echo 'http://dl-cdn.alpinelinux.org/alpine/v3.5/community' >>/etc/apk/repositories \
    && apk update && apk add tzdata curl bash wget ca-certificates openssl \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \ 
    && echo "Asia/Shanghai" > /etc/timezone 

# Add dependencies to get Bun working on Alpine
COPY ./glibc-2.28-r0.apk /glibc-2.28-r0.apk
RUN apk add --allow-untrusted --force-overwrite /glibc-2.28-r0.apk
RUN rm /glibc-2.28-r0.apk

# Install bun dependencies glibc
RUN npm i -g bun

RUN rm -rf /var/cache/apk/* 

WORKDIR /app