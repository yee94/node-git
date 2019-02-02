FROM node:10.10-alpine

RUN apk update && apk add git openssh-client \
    && npm i -g yarn

RUN  echo 'http://mirrors.ustc.edu.cn/alpine/v3.5/main' > /etc/apk/repositories \
    && echo 'http://mirrors.ustc.edu.cn/alpine/v3.5/community' >>/etc/apk/repositories \
&& apk update && apk add tzdata \
&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \ 
&& echo "Asia/Shanghai" > /etc/timezone
