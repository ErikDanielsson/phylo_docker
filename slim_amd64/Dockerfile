# BASE IMAGE
FROM sswiston/phylo_docker:basic_amd64

ARG TAG="placeholder-tag"
ARG REV="main"

# BASE SOFTWARE
RUN apk add boost-dev

# REVBAYES
WORKDIR "/"
RUN git clone https://github.com/revbayes/revbayes.git /revbayes
WORKDIR "/revbayes/"
RUN git checkout ${REV}
WORKDIR "/revbayes/projects/cmake/"
RUN ./build.sh
ENV PATH=/revbayes/projects/cmake:$PATH
RUN ln -s /revbayes/projects/cmake/rb /usr/local/bin/rb

# FINISHING
WORKDIR "/"
COPY dockerfile_${TAG}.txt /dockerfile_${TAG}.txt
COPY test.sh /test.sh
ENV HOME="/"
CMD sleep infinity
