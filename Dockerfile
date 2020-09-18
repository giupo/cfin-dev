FROM giupo/r-dev:3.5.3
RUN apt-get update && \
      apt-get -y upgrade

# installs the exact version of the production systems.
RUN mkdir -p /deleteme
COPY install_prod_deps.sh /deleteme
RUN /deleteme/install_prod_deps.sh && rm -rf /deleteme

VOLUME /home/pkg
WORKDIR /home/pkg

CMD ['bash']
