FROM debian
RUN apt update && apt install -y ssh npm curl\
  && npm install -g wstunnel 
RUN echo 'wstunnel -s 0.0.0.0:80 &' >> /wstunnel.sh \
  && echo '/usr/sbin/sshd -D' >> /wstunnel.sh \
  && echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config \
  && chmod +x /wstunnel.sh
EXPOSE 80
CMD /wstunnel.sh
