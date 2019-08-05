docker system prune -f
docker rmi stalk-base-img
docker build -t sandywadhwa/stalk-base-img -f Dockerfile.base .
# docker images
# docker tag 1e44a779149e sandywadhwa/stalk-base-img:latest
# docker push sandywadhwa/stalk-base-img:latest
