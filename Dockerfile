FROM node:alpine
RUN apk update && apk upgrade
RUN apk add --update --no-cache git
RUN apk add --update --no-cache python3
RUN apk add --update --no-cache make
RUN apk add --update --no-cache openssh
WORKDIR /data
RUN git clone https://github.com/BlueWallet/LndHub.git /data/app
WORKDIR /data/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
#COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source (uncomment if needed in image)
#COPY . .

#EXPOSE 8080
EXPOSE 3000
CMD [ "node", "server.js" ]

