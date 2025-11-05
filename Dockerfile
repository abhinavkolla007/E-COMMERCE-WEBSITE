# Frontend Dockerfile - multi-stage build: build with Node, serve with nginx
FROM --platform=linux/amd64 node:18-alpine AS build
WORKDIR /app

COPY package*.json ./
RUN npm install --production=false

COPY . .
RUN npm run build

# ---- Serve with Nginx ----
FROM --platform=linux/amd64 nginx:stable-alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
