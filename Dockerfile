# Choose base image
FROM node:lts-alpine

# app folder inside container
WORKDIR /app

## copying only pacakge.json as for npm install only these files matters
## npm install layers next to COPY will run only if there are chagnes 
## in these files

# copy root pacakge.json
COPY package.json ./

# copy root 1-github package.json
COPY ./1-github/package.json /app/1-github/
# copy content to container working directory

# Go to root
WORKDIR /

## copy source code before build
COPY . /app/

# Go to 1-github 
WORKDIR '/app/1-github'

# Install dependencies
RUN npm install

# build and start server.
RUN npm run build

# Define PORT for container
EXPOSE 5000