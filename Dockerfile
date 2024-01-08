# First stage - Building the application
# Use node:16-a;pine image as a parent image
FROM node:16-alpine AS build

# Create app directory
WORKDIR /usr/src/app

# Copy package.json files to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the source files
COPY . .

# Build the React app for production
RUN npm run build

# Second stage - Serve the application
FROM nginx:alpine

# Copy build files to Nginx
COPY --from=build /usr/src/app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]