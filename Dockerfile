FROM node:16-alpine AS build
WORKDIR /app
COPY . .
RUN yarn
RUN yarn build

FROM nginx:stable-alpine
COPY --from=build nginx/default.conf /etc/nginx/conf.d/default.conf
# COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]