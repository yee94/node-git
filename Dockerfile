FROM node:10.10-alpine

RUN apk update && apk add git openssh-client \
    && npm i -g yarn

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

