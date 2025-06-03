# BASE IMAGE
FROM sswiston/phylo_docker:basic_amd64

# BASE SOFTWARE
RUN apk add boost-dev

# REVBAYES
# stable: stochmap_tp_dirty_merge branch commit d86165c (20241218)
# testing: stochmap_tp_dirty_merge branch commit 93075a5 (20250314)
WORKDIR "/"
RUN git clone https://github.com/revbayes/revbayes.git /revbayes
WORKDIR "/revbayes/"
RUN git checkout stochmap_tp_dirty_merge 
WORKDIR "/revbayes/projects/cmake/"
RUN ./build.sh
ENV PATH=/revbayes/projects/cmake:$PATH
# OLD COMMAND TO ADD RB TO PATH
# RUN ln -s /revbayes/projects/cmake/rb /usr/local/bin/rb
RUN ln -s /revbayes/projects/cmake/build/rb /usr/local/bin/rb

# FINISHING
WORKDIR "/"
COPY dockerfile_devtest_amd64.txt /dockerfile_devtest_amd64.txt
COPY test.sh /test.sh
ENV HOME="/"
CMD sleep infinity

# Command for building Docker image:
# cp Dockerfile dockerfile_devtest_amd64.txt; docker build --no-cache -t sswiston/phylo_docker:devtest_amd64 . --progress=plain > devtest_amd64_build.log 2>&1