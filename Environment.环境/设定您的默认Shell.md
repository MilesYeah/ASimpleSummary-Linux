# 设定您的默认Shell

如果能够拥有root权限，可以直接修改 `/etc/passwd` 文件。找到您用户ID起始的行
```sh
user:x:1000:112:user,,,:/home/user:/bin/bash
```
最后一个字段为登录后的默认Shell, `/bin/bash` 是程序 bash 的主程序路径。 fish 主程序的路径通常为 /usr/bin/fish 。



`/etc/shells` 中列出系统中所有可用Shell（ `/bin/false` 代表禁用Shell）



也可以使用如下命令更改您的默认Shell
```sh
chsh -s /usr/bin/fish　　（需要输入您的密码）
```

Tip：可以使用 `whereis xxx` 命令，来查找 xxx 程序的安装位置，详见 搜索。

