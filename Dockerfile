FROM ubuntu:16.04


WORKDIR /usr/src/stalk
COPY requirements.txt ./

RUN apt-get update -y 
RUN apt-get install -y python-dev libxml2-dev libxslt1-dev zlib1g-dev python-pip

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

RUN apt-get install -y curl wget unzip git nodejs npm
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
WORKDIR /usr/src/test-app
COPY test-app ./
RUN npm install
EXPOSE 3000

CMD ["/usr/bin/node", "server.js"]

# CMD ["/usr/bin/python web2py.py -a sandy"]