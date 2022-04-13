FROM node:14

# Create app directory
WORKDIR /usr/src/app

# A compilação de um container é realizada através de camadas,
# portanto, é interessante separar arquivos que mudem muito em
# etapas separadas, de modo que as demais sejam reaproveitadas.
# Por isso que o passo de copiar o package*.json está separado dos demaiss
COPY package*.json ./

RUN npm install

# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "node", "server.js" ]
