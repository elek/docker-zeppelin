

VERSION ?= latest
URL ?= http://xenia.sote.hu/ftp/mirrors/www.apache.org/zeppelin/zeppelin-0.7.3/zeppelin-0.7.3-bin-all.tgz
SPARKVERSION ?= 2.2.0

build:
		  docker pull flokkr/spark:$(SPARKVERSION)
		  docker tag flokkr/spark:$(SPARKVERSION) flokkr/spark:build
		  echo $(URL) > url
		  docker build -t flokkr/zeppelin:$(VERSION) .

deploy:
		  docker push flokkr/zeppelin:$(VERSION)

.PHONY: deploy build
