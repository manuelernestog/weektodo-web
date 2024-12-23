FROM node:16-alpine
WORKDIR /app
COPY package.json /app
COPY yarn.lock /app
RUN yarn install --frozen-lockfile && yarn cache clean
COPY . /app
CMD yarn run serve
EXPOSE 8080
