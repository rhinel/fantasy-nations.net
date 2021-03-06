#! /bin/bash

start=`date +%s`

echo -e "\033[34m`date "+%T"`\033[0m"  "--> 开始本地处理"

cd ~/gitcode/fantasy-nations.net/

echo -e "\033[34m`date "+%T"`\033[0m"  "--> fetch当前分支"
echo -e "\033[34m`date "+%T"`\033[0m"  "--> $1"

git status

echo -e "\033[34m`date "+%T"`\033[0m"  "--> git checkout $1"
git checkout $1

echo -e "\033[34m`date "+%T"`\033[0m"  "--> git pull --all"

git pull --all
git fetch -p

echo -e "\033[34m`date "+%T"`\033[0m"  "--> 更新生产版本依赖"

yarn install --production=true

yarn git-init

echo -e "\033[34m`date "+%T"`\033[0m"  "--> docker restart"

sh ./myhomepage.sh

end=`date +%s`
dif=$[ end - start ]
echo -e "\033[42;37m done! \033[0m" $dif"s"
