FROM node:14.2.0-alpine3.10

WORKDIR /app
COPY package*.json* ./
RUN npm install
COPY . .

CMD ["yarn", "run", "build"]


FROM nginx:1.17.10-alpine

EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html


