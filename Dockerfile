##### Stage 1 - Development - Generate dist folder
FROM node:20 AS builder
LABEL author="Swadesh Behera"

RUN npm install -g pnpm

# Add timezone
RUN apt-get install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

WORKDIR /usr/app
COPY . .
RUN pnpm run build
##### Stage 2 - Production
ENV PUPPETEER_SKIP_DOWNLOAD="true"
ENV NODE_ENV=production
CMD [ "pnpm", "start" ]
