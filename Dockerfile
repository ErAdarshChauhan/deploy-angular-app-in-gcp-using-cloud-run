FROM node:16.18.1 as build
WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .
RUN npm run prod
FROM nginx:1.19
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/dist/book-management-system/ /usr/share/nginx/html