# Docker file for Covid 19 Cases vs. Tests
# author: Fatime Selimi, Neel Phaterpekar, Nicholas Wu, Tanmay Sharma
# date: 2020-12-10

# use rocker/tidyverse as the base image
FROM rocker/tidyverse

# install R packages
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  && install2.r --error \
    --deps TRUE \
    readr \
    knitr \
    ggthemes

RUN apt-get install libmagick++-dev -y && apt-get -y install ghostscript

# install the rest of R packages using install.packages
RUN Rscript -e "install.packages('broom')"
RUN Rscript -e "install.packages('kableExtra')"
RUN Rscript -e "install.packages('magick')"
RUN Rscript -e "install.packages('cowplot')"
RUN Rscript -e "install.packages('docopt')"
RUN Rscript -e "install.packages('infer')"
RUN Rscript -e 'install.packages(c("rmarkdown","tinytex"))'
RUN Rscript -e 'tinytex::install_tinytex()'