# Frontend Dockerfile for Angular
FROM node:16 AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

FROM nginx:alpine
COPY --from=build /app/dist/arsi-devops-front /usr/share/nginx/html
EXPOSE 80
