# Frontend Dockerfile for Angular
FROM node:18 AS build
WORKDIR /app
COPY . .
RUN npm install --legacy-peer-deps
RUN npm run build --prod

FROM nginx:alpine
COPY --from=build /app/dist/arsi-devops-front /usr/share/nginx/html
EXPOSE 80
