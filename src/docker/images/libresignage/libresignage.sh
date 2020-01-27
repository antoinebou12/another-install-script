#!/usr/bin/env bash
docker run -d -p 8030:80 --mount source=/ls,target=/var/www/html/data eerotal/libresignage:latest