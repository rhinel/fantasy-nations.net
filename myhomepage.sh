#! /bin/bash
# 删除原有容器
docker rm -f myhomepage

# 启动并自动重启
docker run \
 --name myhomepage \
 -p 3080:80 \
 -v $PWD:/webapp \
 -v $PWD/../ssl-key:/ssl-key \
 -w /webapp \
 -d node npm start