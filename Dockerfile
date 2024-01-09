FROM node:16.15-alpine AS builder
ENV NODE_ENV production
WORKDIR /app
COPY package* /app/
RUN yarn
COPY . .
RUN yarn build

FROM nginx:1.21.0-alpine AS production
ENV NODE_ENV production
COPY --from=builder  /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]