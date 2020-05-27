docker system prune -f
docker rmi stalk-base-img-base
docker build -t sandywadhwa/stalk-base-img-base -f Dockerfile.base .
# docker images
# docker tag 1e44a779149e sandywadhwa/stalk-base-img:latest
docker push sandywadhwa/stalk-base-img-base:latest
