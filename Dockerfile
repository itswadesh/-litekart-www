FROM node:18

WORKDIR /usr/src/app

# Copy root package.json and lockfile
COPY package.json ./
COPY pnpm-lock.yaml ./

RUN npm i -g pnpm

# Copy the docs package.json
COPY apps/web/package.json ./apps/web/package.json

RUN pnpm install

# Copy app source
COPY . .

EXPOSE 3000

CMD [ "npm", "run", "start:web" ]