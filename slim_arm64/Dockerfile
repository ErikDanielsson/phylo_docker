# BASE IMAGE
FROM sswiston/phylo_docker:basic_arm64

# BASE SOFTWARE
RUN apk add boost-dev

# REVBAYES
# stochmap_tp_dirty_merge branch commit ea86725 (20250501)
WORKDIR "/"
RUN git clone https://github.com/revbayes/revbayes.git /revbayes
WORKDIR "/revbayes/"
RUN git checkout stochmap_tp_dirty_merge
WORKDIR "/revbayes/projects/cmake/"
RUN ./build.sh
ENV PATH=/revbayes/projects/cmake:$PATH
RUN ln -s /revbayes/projects/cmake/build/rb /usr/local/bin/rb

# TENSORPHYLO
# tree-inference branch commit b326fbf (20250213)
WORKDIR "/"
RUN git clone https://bitbucket.org/mrmay/tensorphylo.git /tensorphylo
WORKDIR "/tensorphylo/"
RUN git checkout tree-inference
WORKDIR "/tensorphylo/build/installer/"
RUN sed -i -e 's/configure --prefix=${ncl_folder}/configure --prefix=${ncl_folder} --build=aarch64-unknown-linux-gnu/g' install.sh
RUN bash install.sh && \
    mkdir /.plugins && \
    cp /tensorphylo/build/installer/lib/libTensorPhylo.so /.plugins/libTensorPhylo.so

# FINISHING
WORKDIR "/"
COPY dockerfile_slim_arm64.txt /dockerfile_slim_arm64.txt
COPY test.sh /test.sh
ENV HOME="/"
CMD sleep infinity

# Command for building Docker image:
# cp Dockerfile dockerfile_slim_arm64.txt; docker buildx build --platform=linux/arm64 -t sswiston/phylo_docker:slim_arm64 . --progress=plain > slim_arm64_build.log 2>&1