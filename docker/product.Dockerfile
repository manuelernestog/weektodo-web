# frist prase 
FROM node:16-alpine AS builder
WORKDIR /app
COPY package.json yarn.lock /app/
RUN yarn install --frozen-lockfile && yarn cache clean
# because dcoker is layer build and every layer docker when builded will has cache,so we can use cache to speed up the build
COPY . /app
RUN ["yarn", "run", "build"]
# second prase
FROM caddy:latest
WORKDIR /app
COPY --from=builder /app/dist /usr/share/caddy/
EXPOSE 80
