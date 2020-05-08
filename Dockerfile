FROM node:14.2.0-alpine3.10 as builder

WORKDIR /app

COPY package.json package-lock.json* ./

RUN npm install

COPY . .

CMD ["yarn", "run", "build"]


FROM nginx:1.17.10-alpine
COPY --from=builder /app/build /usr/share/nginx/html


