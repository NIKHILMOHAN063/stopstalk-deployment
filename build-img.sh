docker system prune -f
docker stop stalk-container
docker rm stalk-container
docker build -t stalk-img .
docker run -i -t -d --name stalk-container stalk-img 
# docker ps -a
docker exec -it stalk-container service mysql status
# docker run --privileged -p 3306:3306 --name stalk-container stalk-img 
#docker run --privileged -p 8000:8000 -d --name stalk-container stalk-img 
# docker logs stalk-container
# docker exec -it stalk-container bash