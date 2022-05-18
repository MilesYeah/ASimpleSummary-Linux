# semanage

semanage命令

semanage命令用于管理SELinux的策略，格式为“semanage [选项] [文件]”。

SELinux服务极大地提升了Linux系统的安全性，将用户权限牢牢地锁在笼子里。
semanage命令不仅能够像传统chcon命令那样—设置文件、目录的策略，还可以管理网络端口、消息接口（这些新特性将在本章后文中涵盖）。

使用semanage命令时，经常用到的几个参数及其功能如下所示：
* -l参数用于查询；
* -a参数用于添加；
* -m参数用于修改；
* -d参数用于删除。

