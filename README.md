[![Build Status](https://travis-ci.org/chakkritte/docker-nginx-rtmp.svg?branch=master)](https://travis-ci.org/chakkritte/docker-nginx-rtmp)


# Docker-nginx-rtmp

#Download#

    docker pull chakkritte/docker-nginx-rtmp

#Run#

    mkdir -p /var/www/demo/html
    docker run -d -p 80:80 -p 1935:1935 -v /var/www/demo/html:/usr/local/nginx/html  chakkritte/docker-nginx-rtmp

#Live#

    Streaming Service: Custom

    Server: rtmp://{IP}/live

    Play Path/Stream Key: test
