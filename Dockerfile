FROM flokkr/spark:latest
ARG URL
RUN apk add --no-cache libstdc++
ENV HADOOP_CONF_DIR /opt/zeppelin/conf
ENV SPARK_HOME /opt/spark
ENV SPARK_CONF_DIR /opt/zeppelin/conf
ENV CONF_DIR /opt/zeppelin/conf
RUN wget $URL -O zeppelin.tar.gz && tar zxf zeppelin.tar.gz && rm zeppelin.tar.gz && mv zeppelin* zeppelin 
ADD log4j.properties /opt/zeppelin/conf/log4j.properties
CMD ["/opt/zeppelin/bin/zeppelin.sh"]
