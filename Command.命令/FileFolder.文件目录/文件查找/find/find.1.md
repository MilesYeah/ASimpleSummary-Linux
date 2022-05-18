

## find命令

find命令用于按照指定条件来查找文件，格式为“find [查找路径] 寻找条件 操作”。

本书中曾经多次提到“Linux系统中的一切都是文件”，接下来就要见证这句话的分量了。在Linux系统中，搜索工作一般都是通过find命令来完成的，它可以使用不同的文件特性作为寻找条件（如文件名、大小、修改时间、权限等信息），一旦匹配成功则默认将信息显示到屏幕上。find命令的参数以及作用如表2-16所示。

| 参数               | 作用                                                                                   |
| ------------------ | -------------------------------------------------------------------------------------- |
| -name              | 匹配名称                                                                               |
| -perm              | 匹配权限（mode为完全匹配，-mode为包含即可）                                            |
| -user              | 匹配所有者                                                                             |
| -group             | 匹配所有组                                                                             |
| -mtime -n +n       | 匹配修改内容的时间（-n指n天以内，+n指n天以前）                                         |
| -atime -n +n       | 匹配访问文件的时间（-n指n天以内，+n指n天以前）                                         |
| -ctime -n +n       | 匹配修改文件权限的时间（-n指n天以内，+n指n天以前）                                     |
| -nouser            | 匹配无所有者的文件                                                                     |
| -nogroup           | 匹配无所有组的文件                                                                     |
| -newer f1 !f2      | 匹配比文件f1新但比f2旧的文件                                                           |
| --type b/d/c/p/l/f | 匹配文件类型（后面的字幕字母依次表示块设备、目录、字符设备、管道、链接文件、文本文件） |
| -size              | 匹配文件的大小（+50KB为查找超过50KB的文件，而-50KB为查找小于50KB的文件）               |
| -prune             | 忽略某个目录                                                                           |
| -exec …… {}\;      | 后面可跟用于进一步处理搜索结果的命令（下文会有演示）                                   |

这里需要重点讲解一下-exec参数重要的作用。这个参数用于把find命令搜索到的结果交由紧随其后的命令作进一步处理，它十分类似于第3章将要讲解的管道符技术，并且由于find命令对参数的特殊要求，因此虽然exec是长格式形式，但依然只需要一个减号（-）。

根据文件系统层次标准（Filesystem Hierarchy Standard）协议，Linux系统中的配置文件会保存到/etc目录中（详见第6章）。如果要想获取到该目录中所有以host开头的文件列表，可以执行如下命令：
```sh
[root@linuxprobe ~]# find /etc -name "host*" -print
/etc/avahi/hosts
/etc/host.conf
/etc/hosts
/etc/hosts.allow
/etc/hosts.deny
/etc/selinux/targeted/modules/active/modules/hostname.pp
/etc/hostname
```
如果要在整个系统中搜索权限中包括SUID权限的所有文件（详见第5章），只需使用-4000即可：
```sh
[root@linuxprobe ~]# find / -perm -4000 -print
/usr/bin/fusermount
/usr/bin/su
/usr/bin/umount
/usr/bin/passwd
/usr/sbin/userhelper
/usr/sbin/usernetctl
………………省略部分输出信息………………
```

    进阶实验：在整个文件系统中找出所有归属于linuxprobe用户的文件并复制到/root/findresults目录。

    该实验的重点是“-exec {}   \;”参数，其中的{}表示find命令搜索出的每一个文件，并且命令的结尾必须是“\;”。完成该实验的具体命令如下：

    [root@linuxprobe ~]# find / -user linuxprobe -exec cp -a {} /root/findresults/ \;


