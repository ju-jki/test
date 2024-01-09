FROM node:16-alpine AS build
WORKDIR /app
COPY package*.json /app/
RUN yarn
COPY . .
RUN yarn build

FROM nginx:stable-alpine
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
# COPY --from=build /app/build /usr/share/nginx/html
RUN rm -rf /usr/share/nginx/html/*
WORKDIR /usr/share/nginx/html
COPY ./build .
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]