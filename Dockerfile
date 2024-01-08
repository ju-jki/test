FROM node:16-alpine AS build
WORKDIR /app
COPY . .
RUN yarn
RUN yarn build
# production environment
FROM nginx:stable-alpine
COPY /app/nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]