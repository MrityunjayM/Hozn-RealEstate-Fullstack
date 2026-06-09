FROM node:20 AS builder

WORKDIR /app

COPY package*.json .

RUN npm install

COPY . .

RUN /app/node_modules/.bin/tsc

FROM node:20-alpine AS final

WORKDIR /app

ENV NODE_ENV=production

COPY --from=builder /app/dist /app/dist
COPY --from=builder /app/package*.json /app/

RUN npm ci

EXPOSE 5000

CMD [ "node", "/app/dist/server.js" ]