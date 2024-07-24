## Boilerplate for rapidly creating a simple, lightweight, auth-based nginx-apple docker image

Put your static files in ```/src```

Fire and forget:
```
docker build -t web-image:v1 .

docker run --rm -d -p 8123:8123 web-image:v1
```

Extra ```docker-compose.yml``` included
