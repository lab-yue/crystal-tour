# client
FROM node:10 AS node
ADD ./client /client
WORKDIR /client
RUN npm install && npm run build

# server
FROM crystallang/crystal:latest AS crystal
ADD ./server /server
WORKDIR /server
RUN shards build --production --static

# final
FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /app
COPY --from=node /client/dist .
COPY --from=crystal /server/bin/server .

EXPOSE 8080
CMD ["./server"]