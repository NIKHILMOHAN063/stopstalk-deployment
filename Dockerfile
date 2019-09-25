FROM python:2-alpine


RUN apk add  --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.7/main/ nodejs=8.9.3-r1



RUN apk add --no-cache git mysql-client


RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base

WORKDIR /usr/src/stalk
COPY requirements.txt ./
RUN pip install --upgrade pip
# RUN pip install -r requirements.txt

RUN npm install uglify-js -g
RUN npm install uglifycss -g

RUN wget http://www.web2py.com/examples/static/web2py_src.zip
RUN unzip web2py_src.zip

WORKDIR /usr/src/stalk/web2py/applications

RUN git clone https://github.com/stopstalk/stopstalk-deployment.git stopstalk
WORKDIR /usr/src/stalk/web2py/applications/stopstalk
RUN cp models/0firstrun.py.sample models/0firstrun.py
WORKDIR /usr/src/stalk/web2py
 
EXPOSE 8000

# TEST APP
# WORKDIR /usr/src/test-app
# COPY test-app ./
# RUN npm install
# EXPOSE 3000

#CMD ["/usr/bin/node", "server.js"]

RUN /usr/bin/mysql -uroot -pPASSWORD -h mysql -e "CREATE DATABASE stopstalkdb;"
RUN /usr/bin/mysql -uroot -pPASSWORD -h mysql -e "CREATE DATABASE uvajudge;"

CMD ["/usr/local/bin/python", "web2py.py", "-i 0.0.0.0", "-a sandy"]