FROM node:buster

RUN groupadd -r lndhubuser -g 1001 && useradd -d /home/lndhubuser -u 1001 -r -g lndhubuser lndhubuser

RUN mkdir /home/lndhubuser/ && chown -R 1001:1001 /home/lndhubuser/
#RUN apt-get update && apt-get -y install git && rm -rf /var/lib/apt/lists/* && apt-get clean ### uncomment to use with buster-slim but it is not compiling properly yet on slim
RUN git clone https://github.com/BlueWallet/LndHub.git /lndhub

WORKDIR /lndhub

RUN npm install -g express

RUN npm install --save helmet

RUN npm i

RUN mkdir /lndhub/logs && chown -R 1001:1001 /lndhub/

USER lndhubuser

EXPOSE 3000

CMD /lndhub/node_modules/.bin/babel-node index.js

# CMD [ "/lndhub/node_modules/.bin/babel-node", "index.js" ] ### alternative to above - which one is better?