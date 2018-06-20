#! /bin/bash
# 删除原有容器
docker rm -f myhomepage

# 启动并自动重启
docker run \
 --restart always \
 --name myhomepage \
 --expose 80 \
 -v /etc/localtime:/etc/localtime \
 -v ~/gitcode/fantasy-nations.net:/webapp \
 -w /webapp \
 -d node npm start
