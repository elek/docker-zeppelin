#!/usr/local/bin/dumb-init /bin/bash
set -e
set -x
source /opt/hadoop-configurator.sh
export CONF_DIR=/opt/zeppelin/conf
initialize
source /opt/zeppelin/conf/zeppelin-env.sh
/opt/zeppelin/bin/zeppelin.sh
