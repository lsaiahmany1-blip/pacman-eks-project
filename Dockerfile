FROM node:20-alpine

WORKDIR /usr/src/app

ENV NODE_ENV=production
ENV PORT=8080

COPY package*.json ./
RUN npm install --omit=dev && npm cache clean --force

COPY app.js ./
COPY bin ./bin
COPY lib ./lib
COPY public ./public
COPY routes ./routes
COPY views ./views

RUN addgroup -S pacman && adduser -S pacman -G pacman
USER pacman

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=5s --start-period=20s --retries=3 \
  CMD wget -qO- http://127.0.0.1:8080/ >/dev/null || exit 1

CMD ["npm", "start"]
