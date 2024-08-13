#!/data/data/com.termux/files/usr/bin/bash
echo "请授予存储权限"
termux-setup-storage
printf "完成请按回车"
read wait
echo "请更换源地址"
sleep 0.5s
termux-change-repo
echo "更新自带软件并安装git(出现选项请输入Y)"
sleep 0.5s
pkg upgrade -y
pkg install git -y
printf "是否安装hexo？(输入yes安装)"
read hexo
case $hexo in
  Yes|yes|y|Y)
  pkg install nodejs-lts -y
  npm config set registry https://registry.npmmirror.com
  npm install -g hexo-cli
#npm install hexo-deployer-git --save
esac
echo "完成"