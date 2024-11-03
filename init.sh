#!/data/data/com.termux/files/usr/bin/bash
echo "请授予存储权限"
termux-setup-storage
printf "完成请按回车"
read wait
echo "请更换源地址"
sleep 1s
termux-change-repo
echo "更新自带软件并安装git(出现选项请输入Y)"
sleep 1s
pkg upgrade -y
pkg install git -y
echo "完成"