FROM elek/spark-base
ADD url ./
RUN wget `cat url` -O zeppelin.tar.gz && tar zxf zeppelin.tar.gz && rm zeppelin.tar.gz && mv zeppelin* zeppelin 
COPY start.sh .
ADD zeppelin-env.sh /opt/zeppelin/conf/zeppelin-env.sh
RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64
RUN chmod +x /usr/local/bin/dumb-init
ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
CMD ["/opt/start.sh"]

