FROM node:buster

RUN groupadd -r lndhubuser -g 1001 && useradd -d /home/lndhubuser -u 1001 -r -g lndhubuser lndhubuser

RUN mkdir /home/lndhubuser/ && chown -R 1001:1001 /home/lndhubuser/
#RUN apt-get update && apt-get upgrade && apt-get -y install git #uncomment to use with buster-slim but it is not compiling properly yet on slim
RUN git clone https://github.com/BlueWallet/LndHub.git /lndhub

WORKDIR /lndhub

RUN npm i

RUN mkdir /lndhub/logs && chown -R 1001:1001 /lndhub/

USER lndhubuser

EXPOSE 3000

# Define default command
CMD /lndhub/node_modules/.bin/babel-node index.js