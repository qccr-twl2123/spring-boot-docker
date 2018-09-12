#!/bin/sh
# 下载资源
cd /home/workspace
git clone https://github.com/livtrip/uber-system.git

# 进入项目路径
cd /home/workspace/spring-boot-docker

# 构建镜像
mvn package docker:build

# 运行容器
docker run -p 8080:8080 -t springboot/spring-boot-docker

