ldd

这个命令可以知道你的一个可执行文件所使用了动态链接库。如：

[hchen@RHELSVR5 ~]# ldd /usr/bin/java
        linux-gate.so.1 =>  (0x00cd9000)
        libgij.so.7rh => /usr/lib/libgij.so.7rh (0x00ed3000)
        libgcj.so.7rh => /usr/lib/libgcj.so.7rh (0x00ed6000)
        libpthread.so.0 => /lib/i686/nosegneg/libpthread.so.0 (0x00110000)
        librt.so.1 => /lib/i686/nosegneg/librt.so.1 (0x009c8000)
        libdl.so.2 => /lib/libdl.so.2 (0x008b5000)
        libz.so.1 => /usr/lib/libz.so.1 (0x00bee000)
        libgcc_s.so.1 => /lib/libgcc_s.so.1 (0x00aa7000)
        libc.so.6 => /lib/i686/nosegneg/libc.so.6 (0x0022f000)
        libm.so.6 => /lib/i686/nosegneg/libm.so.6 (0x00127000)
        /lib/ld-linux.so.2 (0x00214000)


