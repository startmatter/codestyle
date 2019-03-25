ARG NODE_VERSION=10-alpine
ARG ESLINT_CONFIG_AIRBNB_VERSION=17.1.0

FROM node:$NODE_VERSION

RUN mkdir /code

WORKDIR /code

ENV PATH=/usr/lib/node_modules/.bin:$PATH

RUN npx install-peerdeps -g eslint-config-airbnb@$ESLINT_CONFIG_AIRBNB_VERSION && \
    rm -rf /usr/share/man /tmp/* \
    /root/.npm /root/.node-gyp \
    /usr/lib/node_modules/npm/man \
    /usr/lib/node_modules/npm/doc \
    /usr/lib/node_modules/npm/html && \
    find /usr/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf

COPY .eslintrc.json /root/.eslintrc.json

CMD ["eslint", "."]
