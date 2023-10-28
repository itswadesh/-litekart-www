FROM node:18

WORKDIR /usr/src/app

# Copy root package.json and lockfile
COPY package.json ./
COPY pnpm-lock.yaml ./

# Copy the docs package.json
COPY apps/web/package.json ./apps/web/package.json

RUN npm install

# Copy app source
COPY . .

EXPOSE 3000

CMD [ "npm", "start" ]