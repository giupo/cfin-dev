FROM giupo/r-dev:3.5.3
RUN apt-get update && \
      apt-get -y upgrade && apt install -y pkg-config zlib1g-dev

# installs the exact version of the production systems.
COPY install_prod_deps.sh /install_prod_deps.sh
RUN Rscript /install_prod_deps.sh && rm -rf /install_prod_deps.sh
VOLUME /home/pkg
WORKDIR /home/pkg

CMD ["bash"]
