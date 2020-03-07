FROM node:13.8.0-stretch-slim

ENV CLASP_VERSION 2.3.0
ENV TYPE_GOOGLE_APP_SCRIPT_VERSION 1.0.10

RUN npm install -g @google/clasp@$CLASP_VERSION \
    && npm i -S @types/google-apps-script@$TYPE_GOOGLE_APP_SCRIPT_VERSION \
    && touch /root/.clasprc.json

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

CMD [ "clasp" ]