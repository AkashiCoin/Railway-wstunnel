FROM alpine:latest
ARG SERVER_PORT
ARG SERVER_ADDR
RUN apk update && apk add --no-cache ca-certificates npm \
  && npm install -g wstunnel \
  && echo 'wstunnel -t 80:127.0.0.1:${SERVER_PORT} wss://${SERVER_ADDR}' >> /wstunnel.sh \
  && chmod +x /wstunnel.sh
EXPOSE 80
CMD /wstunnel.sh
