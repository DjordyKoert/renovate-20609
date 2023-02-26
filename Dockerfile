FROM renovate/renovate:34

ARG SSH_PRIVATE_KEY

RUN set -ex \
    && mkdir -p ~/.ssh/ \
    && echo "${SSH_PRIVATE_KEY}" > ~/.ssh/id_rsa && chmod 600 ~/.ssh/id_rsa \
    && ssh-keyscan gitlab.ysp.cloud > ~/.ssh/known_hosts

RUN cat ~/.ssh/id_rsa

COPY config.js config.js
