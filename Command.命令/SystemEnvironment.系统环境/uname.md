# uname命令

uname命令用于查看系统内核与系统版本等信息，格式为“uname [-a]”。

在使用uname命令时，一般会固定搭配上-a参数来完整地查看当前系统的内核名称、主机名、内核发行版本、节点名、系统时间、硬件名称、硬件平台、处理器类型以及操作系统名称等信息。
```sh
[root@RHEL7CCIE yum.repos.d]# uname -a
Linux RHEL7CCIE 3.10.0-123.el7.x86_64 #1 SMP Mon May 5 11:16:57 EDT 2014 x86_64 x86_64 x86_64 GNU/Linux
[root@RHEL7CCIE yum.repos.d]#
```

`Linux RHEL7CCIE 3.10.0-123.el7.x86_64 #1 SMP Mon May 5 11:16:57 EDT 2014 x86_64 x86_64 x86_64 GNU/Linux`
* Linux: 平台名称
* RHEL7CCIE: hostname，主机名称
* 3.10.0-123.el7.x86_64: 内核版本
* #1 
* SMP: 打包时的标志符
* Mon May 5 11:16:57 EDT 2014 : 系统的发布时间
* x86_64 x86_64 x86_64: 架构(内核，系统，程序)
* GNU/Linux: GUN下的Linux开源项目


顺带一提，如果要查看当前系统版本的详细信息，则需要查看redhat-release文件，其命令以及相应的结果如下：
```sh
[root@linuxprobe ~]# cat /etc/redhat-release
Red Hat Enterprise Linux Server release 7.0 (Maipo)
```


