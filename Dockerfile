FROM alpine:latest
ARG EXPOSE_PORT
ARG SERVER_PORT
ARG SERVER_ADDR
RUN apk update && apk add --no-cache ca-certificates npm \
  && npm install -g wstunnel
EXPOSE ${EXPOSE_PORT}
CMD wstunnel -t ${EXPOSE_PORT}:127.0.0.1:${SERVER_PORT} wss://${SERVER_ADDR}
