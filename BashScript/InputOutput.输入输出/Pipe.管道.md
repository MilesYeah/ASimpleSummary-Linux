# 管道 |（pipe）

如果数据必需要经过几道手续之后才能得到我们所想要的格式，应该如何来设置？ 

这就牵涉到管道命令pipe，管道命令使用的是符号`|`，另外，管道命令与“连续下达命令”是不一样的。

假设我们想要知道/etc/下有多少文件，那么可以利用`ls /etc`来查阅。不过，因为/etc下的文件太多，导致一口气就将屏幕塞满了～
不知道前面输出的内容是啥？此时，我们可以通过less的协助，利用`ls -al /etc | less`来一页一页翻看。
- 管道命令仅会处理标准输出，对于标准错误输出会予以忽略
- 管道命令必须要能够接受来自前一个指令的数据成为标准输入继续处理才行。

```sh
# 打印/etc/man_db.conf文件
[root@dell_tower miles]# cat /etc/man_db.conf
#
#
# This file is used by the man-db package to configure the man and cat paths.
...(后面部分省略，一共一百多行)...

# 打印/etc/man_db.conf后，过滤掉有#的行，然后将剩下的内容打印
[root@dell_tower miles]# cat /etc/man_db.conf | grep -v "#"
...(限于篇幅，前面部分省略)...
MANDB_MAP       /usr/X11R6/man          /var/cache/man/X11R6
MANDB_MAP       /opt/man                /var/cache/man/opt
SECTION         1 1p 8 2 3 3p 4 5 6 7 9 0p n l p o 1x 2x 3x 4x 5x 6x 7x 8x

# 再使用grep -c将其中有MAP字串的行过滤掉
[root@dell_tower miles]# cat /etc/man_db.conf | grep -v "#" | grep -v MAP
MANDATORY_MANPATH                       /usr/man
MANDATORY_MANPATH                       /usr/share/man
MANDATORY_MANPATH                       /usr/local/share/man
SECTION         1 1p 8 2 3 3p 4 5 6 7 9 0p n l p o 1x 2x 3x 4x 5x 6x 7x 8x

# 最后查找行中有SECTION的行，就只剩下如下这一行
[root@dell_tower miles]# cat /etc/man_db.conf | grep -v "#" | grep -v MAP | grep "SECTION"
SECTION         1 1p 8 2 3 3p 4 5 6 7 9 0p n l p o 1x 2x 3x 4x 5x 6x 7x 8x

可以简单的将管道理解为：将前一个命令的输出作为下一个命令的输入
cat /etc/man_db.conf 的输出是 grep -v "#"的输入
cat /etc/man_db.conf | grep -v "#" 的输出是 grep -v MAP的输入
cat /etc/man_db.conf | grep -v "#" | grep -v MAP 的输出是 grep "SECTION" 的输入
```



## ref
* [实例说明shell i/o常用重定向](http://blog.51yip.com/shell/1169.html)
* []()
* []()
* []()
* []()
* []()

