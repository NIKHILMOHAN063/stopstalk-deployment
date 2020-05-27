docker system prune -f
# docker stop stalk-container
# docker rm stalk-container
docker build -t sandywadhwa/stalk-deploy-img .
# docker run -i -t -d --privileged -p 8000:8000 -d --name stalk-container sandywadhwa/stalk-deploy-img 
# docker ps -a
# docker exec -it stalk-container service mysql status
# docker run --privileged -p 3306:3306 --name stalk-container sandywadhwa/stalk-deploy-img 
#docker run --privileged -p 8000:8000 -d --name stalk-container sandywadhwa/stalk-deploy-img 
# docker logs stalk-container
# docker exec -it stalk-container bash