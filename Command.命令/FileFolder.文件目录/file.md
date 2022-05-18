# file

file 命令用于查看文件的类型，格式为“file 文件名”。

在 Linux 系统中，由于文本、目录、设备等所有这些一切都统称为文件，而我们又不能单凭后缀就知道具体的文件类型，这时就需要使用 file 命令来查看文件类型了。

```sh
[root@RHEL7CCIE ~]# file anaconda-ks.cfg
anaconda-ks.cfg: ASCII text
[root@RHEL7CCIE ~]#
```

```sh
[root@RHEL7CCIE ~]# file /dev/sda
/dev/sda: block special
[root@RHEL7CCIE ~]#
```