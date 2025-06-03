# BASE IMAGE
FROM sswiston/phylo_docker:full_amd64

# PYTHON PACKAGES
#RUN apk add py3-biopython
WORKDIR "/"

# R PACKAGES
#RUN R -e "install.packages('rjson',dependencies=TRUE,repos='http://cran.rstudio.com/')"
WORKDIR "/"
RUN apk add fftw-dev
RUN R -e "install.packages('mcmcse',dependencies=TRUE,repos='http://cran.rstudio.com/')"
RUN R -e "library(devtools);install_github(\"ignacioq/rase\")"
RUN R -e "install.packages('treebalance',dependencies=TRUE,repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('rlist',dependencies=TRUE,repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('poweRbal',dependencies=TRUE,repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('treestats',dependencies=TRUE,repos='http://cran.rstudio.com/')"

# JULIA PACKAGES
#RUN julia -e 'import Pkg; Pkg.update()' && \
#    julia -e 'import Pkg; Pkg.add("StatsBase"); using StatsBase'
WORKDIR "/"

# FINISHING
WORKDIR "/"
COPY dockerfile_packagetest_amd64.txt /dockerfile_packagetest_amd64.txt
COPY test.sh /test.sh
COPY start.sh /start.sh
ENV HOME="/"
CMD sleep infinity

# Command for building Docker image:
# cp Dockerfile dockerfile_packagetest_amd64.txt; docker build -t sswiston/phylo_docker:packagetest_amd64 . --progress=plain > packagetest_amd64_build.log 2>&1