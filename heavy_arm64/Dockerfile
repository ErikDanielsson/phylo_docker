# BASE IMAGE
FROM sswiston/phylo_docker:full_arm64

# JAVA
WORKDIR "/"
RUN apk add --no-cache openjdk8
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk
ENV JRE_HOME=/usr/lib/jvm/java-8-openjdk/jre

# BEAST
WORKDIR "/"
RUN wget https://github.com/beast-dev/beast-mcmc/releases/download/v10.5.0-beta5/BEAST_X_v10.5.0-beta5.tgz && \
    tar zxvf BEAST_X_v10.5.0-beta5.tgz ; rm BEAST_X_v10.5.0-beta5.tgz
ENV PATH=/BEASTv10.5.0/bin:$PATH

# BEAGLE
WORKDIR "/"
RUN git clone --depth=1 https://github.com/beagle-dev/beagle-lib.git
WORKDIR "/beagle-lib"
RUN mkdir build
WORKDIR "/beagle-lib/build"
RUN cmake .. ; make ; make install ; cpack .

# FINISHING
WORKDIR "/"
COPY dockerfile_heavy_arm64.txt /dockerfile_heavy_arm64.txt
COPY test.sh /test.sh
COPY start.sh /start.sh
ENV HOME="/"
CMD sleep infinity

# Command for building Docker image:
# cp Dockerfile dockerfile_heavy_arm64.txt; docker buildx build --platform=linux/arm64 -t sswiston/phylo_docker:heavy_arm64 . --progress=plain > heavy_arm64_build.log 2>&1