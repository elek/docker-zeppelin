FROM elek/spark-base
ENV HADOOP_CONF_DIR /opt/zeppelin/conf
ENV CONF_DIR /opt/zeppelin/conf
ENV SPARK_HOME /opt/spark
ENV SPARK_CONF_DIR /opt/zeppelin/conf
ADD url ./
RUN wget `cat url` -O zeppelin.tar.gz && tar zxf zeppelin.tar.gz && rm zeppelin.tar.gz && mv zeppelin* zeppelin 
CMD ["/opt/zeppelin/bin/zeppelin.sh"]

