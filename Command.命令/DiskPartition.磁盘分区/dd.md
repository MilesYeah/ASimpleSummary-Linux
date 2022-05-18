# dd命令

dd命令用于按照指定大小和个数的数据块来复制文件或转换文件，格式为“dd [参数]”。

dd命令是一个比较重要而且比较有特色的一个命令，它能够让用户按照指定大小和个数的数据块来复制文件的内容。
当然如果愿意的话，还可以在复制过程中转换其中的数据。Linux系统中有一个名为/dev/zero的设备文件，每次在课堂上解释它时都充满哲学理论的色彩。
因为这个文件不会占用系统存储空间，但却可以提供无穷无尽的数据，因此可以使用它作为dd命令的输入文件，来生成一个指定大小的文件。

dd命令的参数及其作用如下表所示。
| 参数  | 作用                          |
| ----- | ----------------------------- |
| if    | 输入的文件名称 input file     |
| of    | 输出的文件名称 output file    |
| bs    | 设置每个“块”的大小 block size |
| count | 设置要复制“块”的个数          |

例如我们可以用dd命令从/dev/zero设备文件中取出一个大小为560MB的数据块，然后保存成名为560_file的文件。
在理解了这个命令后，以后就能随意创建任意大小的文件了：
```sh
[root@linuxprobe ~]# dd if=/dev/zero of=560_file count=1 bs=560M
1+0 records in
1+0 records out
587202560 bytes (587 MB) copied, 27.1755 s, 21.6 MB/s
```

dd命令的功能也绝不仅限于复制文件这么简单。
如果您想把光驱设备中的光盘制作成iso格式的镜像文件，在Windows系统中需要借助于第三方软件才能做到，但在Linux系统中可以直接使用dd命令来压制出光盘镜像文件，将它变成一个可立即使用的iso镜像：
```sh
[root@linuxprobe ~]# dd if=/dev/cdrom of=RHEL-server-7.0-x86_64-LinuxProbe.Com.iso
7311360+0 records in
7311360+0 records out
3743416320 bytes (3.7 GB) copied, 370.758 s, 10.1 MB/s
```

考虑到有些读者会纠结bs块大小与count块个数的关系，下面举一个吃货的例子进行解释。
假设小明的饭量（即需求）是一个固定的值，用来盛饭的勺子的大小即bs块大小，而用勺子盛饭的次数即count块个数。
小明要想吃饱（满足需求），则需要在勺子大小（bs块大小）与用勺子盛饭的次数（count块个数）之间进行平衡。勺子越大，用勺子盛饭的次数就越少。
由上可见，bs与count都是用来指定容量的大小，只要能满足需求，可随意组合搭配方式。



### another sample
复制 anaconda-ks.cfg 的前 100 个字节的内容。
```sh
[root@RHEL7CCIE ~]# dd if=anaconda-ks.cfg of=tempfile bs=100 count=1
1+0 records in
1+0 records out
100 bytes (100 B) copied, 0.000397312 s, 252 kB/s
[root@RHEL7CCIE ~]# cat tempfile
#version=RHEL7
# System authorization information
auth --enableshadow --passalgo=sha512

# Use CDROM[root@RHEL7CCIE ~]# 
```

复制 anaconda-ks.cfg 的前 200 个字节的内容。
```sh
[root@RHEL7CCIE ~]#dd if=anaconda-ks.cfg of=tempfile bs=100 count=2
2+0 records in
2+0 records out
200 bytes (200 B) copied, 0.000651656 s, 307 kB/s
[root@RHEL7CCIE ~]# cat tempfile
#version=RHEL7
# System authorization information
auth --enableshadow --passalgo=sha512

# Use CDROM installation media
cdrom
# Run the Setup Agent on first boot
firstboot --enable
ignoredisk --only-u[root@RHEL7CCIE ~]#
[root@RHEL7CCIE ~]#
```
