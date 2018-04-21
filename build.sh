#!/usr/bin/env bash
set -x

TAG=latest
VERSION=0.7.3


build() {
   URL="https://www.apache.org/dyn/mirrors/mirrors.cgi?action=download&filename=/zeppelin/zeppelin-${VERSION}/zeppelin-${VERSION}-bin-all.tgz"
   docker build --build-arg URL=$URL --label io.github.flokkr.zeppelin.version=$VERSION -t flokkr/zeppelin:${TAG} .
}

deploy() {
   docker push flokkr/zeppelin:${TAG}
}

while getopts ":v:t:" opt; do
  case $opt in
    v)
      VERSION=$OPTARG >&2
      ;;
    t)
      TAG=${OPTARG:-$VERSION}
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done


shift $(($OPTIND -1))
eval $*
