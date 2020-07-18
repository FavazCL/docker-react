# First Phase - Build
FROM node:alpine

WORKDIR '/app'

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# Second Phase - Run
FROM nginx

EXPOSE 80

# Copiamos el resultado de la primera fase, el segundo arg, especifica que queremos copiar
# y el tercer arg. donde lo queremos introducir
COPY --from=0 /app/build /usr/share/nginx/html

