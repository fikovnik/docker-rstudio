FROM rocker/rstudio

RUN apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install \
        procps \
        libmariadb-client-lgpl-dev \
        libxml2-dev \
        texlive

RUN Rscript -e "install.packages(c('tidyverse', 'RMySQL', 'dbplyr'))"

LABEL maintainer "krikava@gmail.com"
