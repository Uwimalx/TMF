#!/data/data/com.termux/files/usr/bin/bash
read -p "输入用户名：" username
git config --global user.name "$username"
read -p "输入邮箱：" email
git config --global user.email $email
read -p "是否生成SSH密钥？[Y/N]" keygen
case $keygen in
[Yy]es|[Yy])
  echo "请一直按回车"
  ssh-keygen -t rsa -C "$email"
  echo "完成！公钥内容如下"
  cat $HOME/.ssh/id_rsa.pub
  echo "你也可以到 ~/.ssh 目录下查看～"
esac