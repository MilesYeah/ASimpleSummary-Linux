# touch命令

touch命令用于创建空白文件或设置文件的时间，格式为“touch [选项] [文件]”。

在创建空白的文本文件方面，这个touch命令相当简捷，简捷到没有必要铺开去讲。比如，touch linuxprobe命令可以创建出一个名为linuxprobe的空白文本文件。对touch命令来讲，有难度的操作主要是体现在设置文件内容的修改时间（mtime）、文件权限或属性的更改时间（ctime）与文件的读取时间（atime）上面。touch命令的参数及其作用如表2-11所示。

| 参数 | 作用                      |
| ---- | ------------------------- |
| -a   | 仅修改“读取时间”（atime） |
| -m   | 仅修改“修改时间”（mtime） |
| -d   | 同时修改atime与mtime      |

接下来，我们先使用ls命令查看一个文件的修改时间，然后修改这个文件，最后再通过touch命令把修改后的文件时间设置成修改之前的时间（很多黑客就是这样做的呢）：
```sh
[root@linuxprobe ~]# ls -l anaconda-ks.cfg 
-rw-------. 1 root root 1213 May  4 15:44 anaconda-ks.cfg
[root@linuxprobe ~]# echo "Visit the LinuxProbe.com to learn linux skills" >> anaconda-ks.cfg
[root@linuxprobe ~]# ls -l anaconda-ks.cfg
-rw-------. 1 root root 1260 Aug  2 01:26 anaconda-ks.cfg
[root@linuxprobe ~]# touch -d "2017-05-04 15:44" anaconda-ks.cfg 
[root@linuxprobe ~]# ls -l anaconda-ks.cfg 
-rw-------. 1 root root 1260 May  4 15:44 anaconda-ks.cfg
```
