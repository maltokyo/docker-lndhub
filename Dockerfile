FROM node:alpine

RUN addgroup --system -g 1001 lndhubuser && adduser --home /home/lndhubuser --uid 1001 --system --ingroup lndhubuser lndhubuser && chown -R 1001:1001 /home/lndhubuser/


RUN apk update
RUN apk upgrade
RUN apk add --update --no-cache git python3 python3-dev build-base pkgconfig libffi-dev autoconf
ENV PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
RUN pip3 install --upgrade pip
RUN pip3 install secp256k1
WORKDIR /git
RUN git clone https://github.com/BlueWallet/LndHub.git /git/lndhub
WORKDIR /git/lndhub

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
#COPY package*.json ./

#RUN npm install -g express

#RUN npm install --save helmet

RUN npm i

# If you are building your code for production
# RUN npm ci --only=production

RUN mkdir /git/lndhub/logs && chown -R 1001:1001 /git/lndhub/

USER lndhubuser


EXPOSE 3000

CMD [ "node", "index.js" ]

