#!/data/data/com.termux/files/usr/bin/bash
echo "请授予存储权限"
termux-setup-storage
read -p "完成请按回车" wait
echo "更换 pkg/apt 软件源地址"
read -p "是否使用一键替换国内源镜像？[Y/N]" mirror
case $mirror in
[Yy]es|[Yy])
  ln -s "$PREFIX/etc/termux/mirrors/chinese_mainland/" "$PREFIX/etc/termux/chosen_mirrors"
;;
*)
  termux-change-repo
esac
echo "更新自带软件并安装git(出现选项请输入Y)"
sleep 1s
pkg upgrade -y
pkg install git -y
echo "完成"