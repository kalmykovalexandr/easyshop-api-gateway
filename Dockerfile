FROM node:20 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

ARG VITE_API_BASE_URL
ARG VITE_AUTH_SERVER_URL
ENV VITE_API_BASE_URL=$VITE_API_BASE_URL
ENV VITE_AUTH_SERVER_URL=$VITE_AUTH_SERVER_URL

RUN npm run build

FROM nginx:alpine
COPY --from=build /app/dist/ /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/default.conf
