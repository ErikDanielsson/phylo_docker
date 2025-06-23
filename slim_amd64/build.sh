# Build RevBayes from stochmap_tp_dirty_merge branch commit d86165c (20241218)
REPO=danielssonerik
NAME=legacy_phylo_docker
TAG=slimmer_amd64
REV=d86165c

cp Dockerfile dockerfile_$TAG.txt
echo $TAG
cat Dockerfile
docker build \
    --tag $REPO/$NAME:$TAG \
    --build-arg TAG=$TAG \
    --build-arg REV=$REV \
    --no-cache \
    . 
