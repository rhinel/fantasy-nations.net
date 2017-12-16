#!/bin/bash

echo "--> 开始本地处理"

cd ~/gitcode/fantasy-nations.net/

echo "--> fetch当前分支"
echo "--> $1"

git status

echo "--> git checkout $1"

git checkout $1

echo "--> git pull --all"

git pull --all
git fetch -p

echo "--> 更新生产版本依赖"

yarn install --production=true

echo "--> docker restart"

sh ./myhomepage.sh

echo "--> 全部完成"
