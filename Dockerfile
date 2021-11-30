FROM node:current-slim as development

WORKDIR /usr/src/app
COPY package.json .
RUN npm install

EXPOSE 8888
CMD [ "npm", "start" ]

COPY . .