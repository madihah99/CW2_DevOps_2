#defining the image i want to build from - using version 19 of LTC (long term support)
FROM node:19

#installs app dependencies
#copies package.json and package-lock.json files
COPY package*.json ./

RUN npm install

#copies server.js code
COPY server.js .

#maps app to port 8080
EXPOSE 8080

#defines commands to run server
CMD ["node", "server.js"]
