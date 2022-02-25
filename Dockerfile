FROM debian
ARG SERVER_PORT
ARG SERVER_ADDR
RUN apt update && apt install -y npm \
  && npm install -g wstunnel 
RUN echo 'wstunnel -t 6443:localhost:6443 wss://frps.up.railway.app' >> /wstunnel.sh \
  && chmod +x /wstunnel.sh
EXPOSE 80
CMD /wstunnel.sh
