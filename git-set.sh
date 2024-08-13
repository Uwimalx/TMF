#!/data/data/com.termux/files/usr/bin/bash
printf "输入用户名："
read username
git config --global user.name "$username"
printf "输入邮箱："
read email
git config --global user.email $email
echo "生成SSH密钥(请一直按回车)"
ssh-keygen -t rsa -C "$email"
echo "完成！如下"
cat $HOME/.ssh/id_rsa.pub
echo "你也可以到.ssh/id_rsa.pub查看～"