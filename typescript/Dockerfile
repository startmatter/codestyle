ARG NODE_VERSION=10-alpine

FROM node:$NODE_VERSION

RUN mkdir /code

WORKDIR /code

ENV PATH=/usr/lib/node_modules/.bin:$PATH

RUN npm install -g typescript tslint tslint-config-standard && \
    rm -rf /usr/share/man /tmp/* \
    /root/.npm /root/.node-gyp \
    /usr/lib/node_modules/npm/man \
    /usr/lib/node_modules/npm/doc \
    /usr/lib/node_modules/npm/html && \
    find /usr/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf

COPY tslint.json /root/tslint.json

CMD ["tslint", "-c", "/root/tslint.json", "'src/**/*.ts'"]
