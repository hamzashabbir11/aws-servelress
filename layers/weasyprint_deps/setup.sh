#!/usr/bin/env bash

docker build -t weasyprint . && \
docker create --name weasyprint weasyprint . && \
docker cp weasyprint:/opt/weasyprint_deps.zip . && \
docker rm weasyprint