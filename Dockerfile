FROM node:20 AS builder

WORKDIR /app

COPY ./package.json .

RUN npm install

COPY . .

RUN npm run build

FROM node:20-alpine AS final

WORKDIR /app

ENV NODE_ENV="production"
ENV NEXT_TELEMETRY_DISABLED=1

COPY --from=builder /app/package*.json /app/
RUN npm ci --omit=dev

COPY ./ /app/
COPY --from=builder /app/.next /app/.next

EXPOSE 3000

CMD [ "/app/node_modules/.bin/next", "start" ]