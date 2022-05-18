# yum 安装软件时被 PackageKit 锁定



yum 安装软件的时候报错
```sh
sudo yum install netease-cloud-music
已加载插件：fastestmirror, langpacks
/var/run/yum.pid 已被锁定，PID 为 13189 的另一个程序正在运行。
Another app is currently holding the yum lock; waiting for it to exit...
  另一个应用程序是：PackageKit
    内存： 28 M RSS （444 MB VSZ）
    已启动： Tue Aug 20 15:43:54 2019 - 00:18之前
    状态  ：睡眠中，进程ID：13189
```
重点就是 PackageKit

 

## 解决问题
三种办法，三选一，不行就换另一种

### 重启机器
```sh
reboot
``` 

### 删除文件再安装
```sh
sudo rm -f /var/run/yum.pid
``` 

### 永久禁用
PackageKit 是一个离线更新服务，基本没啥用途，应该永久禁用。 修改，将enabled=1改为enabled=0
```sh
vim /etc/yum/pluginconf.d/langpacks.conf
```

langpacks.conf 的原样
```sh
[root@localhost ~]# cat /etc/yum/pluginconf.d/langpacks.conf 
[main]
enabled=1

# What langpacks to install is all of:
# - any previously installed langpacks (stored in /var/lib/yum/plugins/langpacks)
# - any languages specified by $LANGUAGE
# - any langpacks listed in langpack_locales below
# -- if this variable is empty, the value of $LANG

#langpack_locales = ja_JP, zh_CN, mr_IN
# Added by Anaconda
langpack_locales=en_US.UTF-8
[root@localhost ~]# 
```

