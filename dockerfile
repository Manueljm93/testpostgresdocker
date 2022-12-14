FROM node:16-alpine
WORKDIR /app
COPY package.json /app
RUN npm install
COPY ./src /app
COPY app.js /app
CMD [ "node", "app.js" ]