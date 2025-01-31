#!/data/data/com.termux/files/usr/bin/bash

#设置启动页面↓
#nano $PREFIX/etc/motd

printf "是否备份？(输入yes确定)"
read backup
case $backup in
  y|Y|yes|Yes)
  mv "$HOME/.termux" "$HOME/.termux.bak.$(date +%Y.%m.%d-%H:%M:%S)"
  mv "$HOME/.zshrc" "$HOME/.zshrc.bak.$(date +%Y.%m.%d-%H:%M:%S)"
  ;;
  *)
  rm -rf $HOME/.termux
  rm -f $HOME/.zshrc
esac

printf "是否使用gitclone.com镜像源？(输入yes确定)"
read mirror
case $mirror in
  y|Y|yes|Yes)
  git config --global url."https://gitclone.com/".insteadOf https://
esac

pkg install zsh git -y
git clone https://github.com/Cabbagec/termux-ohmyzsh.git "$HOME/termux-ohmyzsh" --depth 1

cp -R "$HOME/termux-ohmyzsh/.termux" "$HOME/.termux"
rm -rf $HOME/termux-ohmyzsh

git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh" --depth 1
cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"
sed -i '/^ZSH_THEME/d' "$HOME/.zshrc"
sed -i '1iZSH_THEME="agnoster"' "$HOME/.zshrc"
#去掉累赘的用户名@主机
sed -i '92{s/^/#/}' "$HOME/.oh-my-zsh/themes/agnoster.zsh-theme"

echo "alias chcolor='$HOME/.termux/colors.sh'" >> "$HOME/.zshrc"
echo "alias chfont='$HOME/.termux/fonts.sh'" >> "$HOME/.zshrc"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" --depth 1
echo "source $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"

git clone https://github.com/zsh-users/zsh-autosuggestions.git "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" --depth 1
echo "source $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> "$HOME/.zshrc"
case $mirror in
  y|Y|yes|Yes)
  git config --global --unset url.https://gitclone.com/.insteadof
esac

chsh -s zsh

clear
echo "oh-my-zsh安装完成！"
sleep 1s
echo "选择你的配色主题~"
$HOME/.termux/colors.sh

echo "选择你的字体～"
$HOME/.termux/fonts.sh

echo "请重启termux(*≧▽≦)ツ"
exit