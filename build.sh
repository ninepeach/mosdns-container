#!/bin/bash

source .env

#docker buildx build --platform=linux/amd64,linux/arm64,darwin/amd64,darwin/arm64 \
docker buildx build --platform=linux/amd64,linux/arm64,darwin/amd64,darwin/arm64 \
                    --build-arg TAG=${TAG} \
                    --progress=plain \
                    -t ninepeach/mosdns-n4s --push .