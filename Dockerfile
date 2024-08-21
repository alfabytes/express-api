FROM node:18-alpine AS builder

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci --only=production

COPY . .

RUN addgroup -S app && adduser -S app -G app
RUN chown -R app:app /usr/src/app

FROM node:18-alpine

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app .

USER app

EXPOSE 3000

CMD ["node", "app.js"]