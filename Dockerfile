# First Phase - Build
FROM node:alpine as builder 

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# Second Phase - Run
FROM nginx

# Copiamos el resultado de la primera fase, el segundo arg, especifica que queremos copiar
# y el tercer arg. donde lo queremos introducir
COPY --from=builder /app/build /usr/share/nginx/html

