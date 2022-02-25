FROM debian
ARG SERVER_PORT
ARG SERVER_ADDR
RUN apt update && apt install -y npm \
  && npm install -g wstunnel \
  && echo 'wstunnel -t 80:localhost:6443 wss://frps.up.railway.app' >> /wstunnel.sh \
  && chmod +x /wstunnel.sh
EXPOSE 80
CMD /wstunnel.sh
