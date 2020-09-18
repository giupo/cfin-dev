FROM giupo/r-dev:3.5.3
RUN apt-get  update  -q && \
  apt-get -yq upgrade && \
  apt install -y pkg-config zlib1g-dev libblas-dev liblapack-dev unixodbc-dev

# installs the exact version of the production systems.
COPY install_prod_deps.sh /install_prod_deps.sh
RUN Rscript /install_prod_deps.sh && rm -rf /install_prod_deps.sh
VOLUME /home/pkg
WORKDIR /home/pkg

CMD ["bash"]
