FROM ubuntu:16.04

WORKDIR /usr/src/stalk
COPY requirements.txt ./

RUN apt-get update -y 
RUN apt-get install -y python-dev libxml2-dev libxslt1-dev zlib1g-dev python-pip

RUN pip install --upgrade pip \
RUN pip install -r requirements.txt

RUN npm install uglify-js -g
RUN npm install uglifycss -g
RUN apt-get install -y curl wget unzip git nodejs npm 

RUN wget http://www.web2py.com/examples/static/web2py_src.zip
RUN unzip web2py_src.zip
WORKDIR /usr/src/stalk/web2py/applications
RUN git clone https://github.com/stopstalk/stopstalk-deployment.git stopstalk
WORKDIR /usr/src/stalk/web2py/applications/stopstalk
RUN cp models/0firstrun.py.sample models/0firstrun.py

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server \
 && sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mysql.conf.d/mysqld.cnf \
 && mkdir /var/run/mysqld \
 && chown -R mysql:mysql /var/run/mysqld
 
VOLUME ["/var/lib/mysql"]
 
EXPOSE 3306
EXPOSE 8000
 
CMD ["mysqld_safe"]