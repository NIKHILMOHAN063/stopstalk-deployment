FROM sandywadhwa/stalk-base-img:latest

WORKDIR /usr/src/stalk/web2py/applications

RUN /usr/bin/mysql -uroot -e "use mysql; update user set authentication_string=PASSWORD('PASSWORD') where User='root'; flush privileges;"
RUN /usr/bin/mysql -uroot -pPASSWORD -e "CREATE DATABASE stopstalkdb;"
RUN /usr/bin/mysql -uroot -pPASSWORD -e "CREATE DATABASE uvajudge;"
RUN git clone https://github.com/stopstalk/stopstalk-deployment.git stopstalk
WORKDIR /usr/src/stalk/web2py/applications/stopstalk
RUN cp models/0firstrun.py.sample models/0firstrun.py
WORKDIR /usr/src/stalk/web2py
 
EXPOSE 3306
EXPOSE 8000
 
CMD ["python web2py.py -a sandy"]