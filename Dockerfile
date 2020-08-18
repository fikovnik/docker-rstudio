FROM rocker/rstudio
LABEL maintainer "krikava@gmail.com"

ARG CRAN_MIRROR=https://mirrors.nic.cz/R

RUN apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install \
        zlib1g-dev \
        libssh2-1-dev \
        procps \
        libxml2-dev \
        texlive

ADD r-packages.txt /r-packages.txt

RUN Rscript -e "install.packages(readLines('/r-packages.txt'), Ncpus=16)"
RUN Rscript -e "devtools::install_github('PRL-PRG/streamr')"
