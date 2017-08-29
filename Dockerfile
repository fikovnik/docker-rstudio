FROM rocker/rstudio

RUN apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install \
        zlib1g-dev \
        libssh2-1-dev \
        procps \
        libmariadb-client-lgpl-dev \
        libxml2-dev \
        texlive

RUN Rscript -e "install.packages(c('devtools', 'roxygen2', 'tidyverse', 'RMySQL', 'dbplyr', 'codetools', 'testthat'))"

LABEL maintainer "krikava@gmail.com"
