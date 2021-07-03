FROM node:alpine
WORKDIR '/app'
COPY ./package.json .
COPY yarn.lock .
RUN yarn install --frozen-lockfile
COPY . .
RUN yarn build

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html
