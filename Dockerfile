FROM node:10-buster

RUN groupadd -r lndhubuser -g 1001 && useradd -d /home/lndhubuser -u 1001 -r -g lndhubuser lndhubuser

RUN mkdir /home/lndhubuser/ && chown -R 1001:1001 /home/lndhubuser/
RUN apt-get update && apt-get upgrade && apt-get install git --no-cache
RUN git clone https://github.com/BlueWallet/LndHub.git /lndhub
#COPY LndHub/ /lndhub/

WORKDIR /lndhub/

RUN npm install -g express

RUN npm install --save helmet

RUN npm i

RUN mkdir /lndhub/logs && chown -R 1001:1001 /lndhub/

USER lndhubuser

EXPOSE 3000

# Define default command
CMD /lndhub/node_modules/.bin/babel-node index.js