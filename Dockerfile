# Frontend Dockerfile for Angular
FROM node:18 AS build
WORKDIR /app
COPY . . 
RUN npm install --legacy-peer-deps
RUN npm run build --configuration production --project=mantis-free-version

FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
