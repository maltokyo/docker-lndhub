FROM node:alpine
RUN apk update
RUN apk upgrade
RUN apk add --update --no-cache git python3 build-base
WORKDIR /git
RUN git clone https://github.com/BlueWallet/LndHub.git /git/lndhub
WORKDIR /git/lndhub

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
CMD [ "node", "index.js" ]

