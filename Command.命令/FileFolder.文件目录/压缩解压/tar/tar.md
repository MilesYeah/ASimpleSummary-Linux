# tar命令

tar命令用于对文件进行打包压缩或解压，格式为“tar [选项] [文件]”。

在Linux系统中，常见的文件格式比较多，其中主要使用的是.tar或.tar.gz或.tar.bz2格式，我们不用担心格式太多而记不住，其实这些格式大部分都是由tar命令来生成的。刘遄老师将讲解最重要的几个参数，以方便大家理解。tar命令的参数及其作用如表2-14所示。

| 参数 | 作用                   |
| ---- | ---------------------- |
| -c   | 创建压缩文件           |
| -x   | 解开压缩文件           |
| -t   | 查看压缩包内有哪些文件 |
| -z   | 用Gzip压缩或解压       |
| -j   | 用bzip2压缩或解压      |
| -v   | 显示压缩或解压的过程   |
| -f   | 目标文件名             |
| -p   | 保留原始的权限与属性   |
| -P   | 使用绝对路径来压缩     |
| -C   | 指定解压到的目录       |

首先，-c参数用于创建压缩文件，-x参数用于解压文件，因此这两个参数不能同时使用。
其次，-z参数指定使用Gzip格式来压缩或解压文件，-j参数指定使用bzip2格式来压缩或解压文件。
用户使用时则是根据文件的后缀来决定应使用何种格式参数进行解压。
在执行某些压缩或解压操作时，可能需要花费数个小时，如果屏幕一直没有输出，您一方面不好判断打包的进度情况，另一方面也会怀疑电脑死机了，因此非常推荐使用-v参数向用户不断显示压缩或解压的过程。
-C参数用于指定要解压到哪个指定的目录。
-f参数特别重要，它必须放到参数的最后一位，代表要压缩或解压的软件包名称。
一般使用“tar -czvf 压缩包名称.tar.gz 要打包的目录”命令把指定的文件进行打包压缩；相应的解压命令为“tar -xzvf 压缩包名称.tar.gz”。

下面我们来逐个演示下打包压缩与解压的操作。先使用tar命令把/etc目录通过gzip格式进行打包压缩，并把文件命名为etc.tar.gz：
```sh
[root@linuxprobe ~]# tar czvf etc.tar.gz /etc
tar: Removing leading `/' from member names
/etc/
/etc/fstab
/etc/crypttab
/etc/mtab
/etc/fonts/
/etc/fonts/conf.d/
/etc/fonts/conf.d/65-0-madan.conf
/etc/fonts/conf.d/59-liberation-sans.conf
/etc/fonts/conf.d/90-ttf-arphic-uming-embolden.conf
/etc/fonts/conf.d/59-liberation-mono.conf
/etc/fonts/conf.d/66-sil-nuosu.conf
………………省略部分压缩过程信息………………
```


接下来将打包后的压缩包文件指定解压到/root/etc目录中（先使用mkdir命令来创建/root/etc目录）：
```sh
[root@linuxprobe ~]# mkdir /root/etc
[root@linuxprobe ~]# tar xzvf etc.tar.gz -C /root/etc
etc/
etc/fstab
etc/crypttab
etc/mtab
etc/fonts/
etc/fonts/conf.d/
etc/fonts/conf.d/65-0-madan.conf
etc/fonts/conf.d/59-liberation-sans.conf
etc/fonts/conf.d/90-ttf-arphic-uming-embolden.conf
etc/fonts/conf.d/59-liberation-mono.conf
etc/fonts/conf.d/66-sil-nuosu.conf
etc/fonts/conf.d/65-1-vlgothic-gothic.conf
etc/fonts/conf.d/65-0-lohit-bengali.conf
etc/fonts/conf.d/20-unhint-small-dejavu-sans.conf
………………省略部分解压过程信息………………
```

