# spring-boot-docker

**参考文章**
- [Spring-Boot-Docker](http://www.ityouknow.com/springboot/2018/03/19/spring-boot-docker.html)  

**docker 常用命令**
```text
1. # 列出本机的所有 image 文件。
 $ docker image ls

2. docker ps  查看正在or停止运行的镜像

3. docker run 运行镜像
eg: docker run -p 8080:8080 -t springboot/spring-boot-docker

4. docker stop 容器ID --关闭镜像

5.# 删除 image 文件
  $ docker image rm [imageName]

6.docker image pull 抓取 image 文件的命令
eg: docker image pull library/hello-world

7.docker container kill [containID] 
  

```
### docker build file 常用命令
```text
FROM
 FROM <image>
 FROM <image>:<tag>
MAINTAINER
 MAINTAINER authorName
 
RUN
 
EXPOSE

ENTERYPOINT

CMD

ADD

COPY

VOLUME

```

### docker 三剑客
## docker machine
```text

```

## docker compose
```text

```

## docker swarm
```text
swarm 是基于 docker 平台实现的集群技术，他可以通过几条简单的指令快速的创建一个 docker 集群，
接着在集群的共享网络上部署应用，最终实现分布式的服务。
```


**测试地址**
- [测试网址](http://47.75.85.48:7777/)  
- [Docker — 从入门到实践](https://yeasy.gitbooks.io/docker_practice)


