FROM rocker/rstudio
LABEL maintainer "krikava@gmail.com"

RUN apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install \
        zlib1g-dev \
        libssh2-1-dev \
        procps \
        libmariadb-client-lgpl-dev \
        libxml2-dev \
        texlive

ADD r-packages.txt /r-packages.txt

RUN Rscript -e "install.packages(readLines('/r-packages.txt'))"
RUN ADD="shiny" bash -x /etc/cont-init.d/add
