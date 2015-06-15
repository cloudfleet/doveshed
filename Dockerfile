FROM cloudfleet/haraka

COPY . /usr/src/app

RUN	groupadd -r node \
&&	useradd -r -g node node

RUN mkdir /usr/src/app/queue && chown node:node /usr/src/app/queue

USER node

EXPOSE 1025
WORKDIR /usr/src/app
CMD ./start.sh