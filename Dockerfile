FROM sandywadhwa/stalk-base-img-base:latest

# WORKDIR /usr/src/stalk/web2py/applications
# COPY . ./stopstalk/

# RUN git clone https://github.com/stopstalk/stopstalk-deployment.git stopstalk
WORKDIR /usr/src/stalk/web2py/applications/stopstalk
# RUN cp models/0firstrun.py.sample models/0firstrun.py


WORKDIR /usr/src/stalk/web2py
EXPOSE 8000

# http://www.web2py.com/AlterEgo/default/show/140
RUN openssl genrsa -out stalk.key 2048
RUN openssl req -new -key stalk.key -out stalk.csr -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=localhost"
RUN openssl x509 -req -days 365 -in stalk.csr -signkey stalk.key -out stalk.crt
RUN chmod -R 777 stalk.*

WORKDIR /usr/src/stalk/web2py
#CMD ["/usr/local/bin/python", "web2py.py", "-i 0.0.0.0", "-a beingzero"]
#CMD ["/usr/local/bin/python", "web2py.py", "-c stalk.crt", "-k stalk.key", "-i 0.0.0.0", "-a beingzero"]


# CMD /usr/local/bin/python web2py.py -c stalk.crt -k stalk.key -i 0.0.0.0 -a beingzero


# WORKDIR /usr/src/test-app
# CMD ["/usr/bin/node", "server.js"]
