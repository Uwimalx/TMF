# TMF
Termux more friendly，让你的 Termux 更友好~

## 脚本介绍
- **init.sh**: 初始化脚本

- **get-set.sh**: 帮助你快速完成git设置

- **TMB.sh**: Termux more beautiful，美化一下～(引用并部分参考了~~大白菜~~[Cabbagec](https://github.com/Cabbagec/)的[termux-ohmyzsh](https://github.com/Cabbagec/termux-ohmyzsh)项目)

- **TMBlite.sh**: 同上，但是配色和字体使用[Termux styling](https://github.com/termux/termux-styling)插件，只安装ohmyzsh，且更适合中国宝宝体质

## 如何使用

直接运行下列命令即可：
```bash
sh -c "$(curl -fsSL https://github.com/Uwimalx/TMF/raw/main/init.sh)"
```

镜像：
```bash
sh -c "$(curl -fsSL https://gh-proxy.com/https://github.com/Uwimalx/TMF/raw/main/init.sh)"
```

> [!TIP]
> 如果你要使用其他脚本的话，将命令中的 `init.sh` 换成其他如 `TMB.sh` 即可

也可参考国光大大的[这篇文章](https://www.sqlsec.com/2018/05/termux.html)

*PS: 如果本项目有10 stars的话，我也可以写篇教程*

## 后言
数据无价，各位~~搞机~~技术人士记得及时备份(/≧▽≦/)

可以用以下命令备份(可能会卡顿一会)：
```bash
tar -zcf /sdcard/termux-backup.tar.gz -C /data/data/com.termux/files ./home ./usr
```

还原则为：
```bash
tar -zxf /sdcard/termux-backup.tar.gz -C /data/data/com.termux/files --recursive-unlink --preserve-permissions
```
