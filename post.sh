json_escape () {
    printf '%s' $1 
}
echo '{ "full_description":' > /tmp/post
cat README.md |  python -c 'import json,sys; print(json.dumps(sys.stdin.read()))' >> /tmp/post
echo '}' >> /tmp/post
curl https://hub.docker.com/v2/repositories/flokkr/zeppelin/ -X PATCH -H "Authorization: $AUTH"  -H "Content-Type: application/json" --data @/tmp/post
