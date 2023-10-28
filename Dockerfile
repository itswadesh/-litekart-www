FROM node:18

WORKDIR /usr/src/app

# Copy root package.json and lockfile
COPY package.json ./
COPY pnpm-lock.yaml ./

RUN npm i -g pnpm

# Copy the docs package.json
COPY apps/web/package.json ./apps/web/package.json

RUN pnpm i --force

# Copy app source
COPY . .

WORKDIR /usr/src/app/apps/web
RUN pnpm i --force

EXPOSE 3000

CMD [ "npm", "start" ]