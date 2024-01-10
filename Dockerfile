FROM node:21-alpine

RUN npm i -g --force yarn pnpm

RUN  echo 'http://dl-cdn.alpinelinux.org/alpine/v3.5/main' > /etc/apk/repositories \
    && echo 'http://dl-cdn.alpinelinux.org/alpine/v3.5/community' >>/etc/apk/repositories \
    && apk update && apk add tzdata curl bash \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \ 
    && echo "Asia/Shanghai" > /etc/timezone \
    && rm -rf /var/cache/apk/* 
