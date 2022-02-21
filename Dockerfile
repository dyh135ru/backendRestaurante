FROM strapi/base:14

ENV PORT 1337

#Create app directory

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

#Installing dependencies
COPY package*.json /usr/src/app/
RUN npm install

#Copying source files
COPY . /usr/src/app/

# Building backend
RUN npm run build
EXPOSE 1337

#Running the backend
CMD "npm" "run" "develop"