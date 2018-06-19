#! /bin/bash
# 删除原有容器
docker rm -f myhomepage

# 启动并自动重启
docker run \
 --restart always \
 --name myhomepage \
 --expose 80 \
 -v $PWD:/webapp \
 -w /webapp \
 -d node npm start
