#!/data/data/com.termux/files/usr/bin/bash

echo "使用镜像源gitdl.cn"
echo
echo "设置启动页面↓
运行 nano $PREFIX/etc/motd"
echo
echo "termux styling安装包↓
https://f-droid.org/zh_Hans/packages/com.termux.styling/
GitHub项目地址↓
https://github.com/termux/termux-styling"
echo

pkg install zsh git -y

printf "是否备份先前的zsh配置？(输入yes确定)"
read backup
case $backup in
  y|Y|yes|Yes)
  mv "$HOME/.zshrc" "$HOME/.zshrc.bak.$(date +%Y.%m.%d-%H:%M:%S)"
  ;;
  *)
  rm -f $HOME/.zshrc
  ;;
esac

printf "要用oh my zsh原版脚本安装吗？这将不会改变主题或者安装插件(输入yes确定)"
read origin
case $origin in
  y|Y|yes|Yes)
  sh -c "$(curl -fsSL https://gitdl.cn/https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ;;
  *)
  git clone https://gitdl.cn/https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh" --depth 1
  cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"
esac

sed -i '/^ZSH_THEME/d' "$HOME/.zshrc"
sed -i '1iZSH_THEME="agnoster"' "$HOME/.zshrc"
#去掉累赘的用户名@主机
sed -i '92{s/^/#/}' "$HOME/.oh-my-zsh/themes/agnoster.zsh-theme"

git clone https://gitdl.cn/https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" --depth 1
echo "source $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"

git clone https://gitdl.cn/https://github.com/zsh-users/zsh-autosuggestions.git "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" --depth 1
echo "source $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> "$HOME/.zshrc"

chsh -s zsh

clear
echo "oh-my-zsh安装完成！"
echo "请重启termux(*≧▽≦)ツ"
exit