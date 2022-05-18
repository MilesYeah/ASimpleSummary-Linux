
# df

df 命令可以列出不同分区的大小，使用情况，使用率，挂载点等信息，加上 -h 选项可以以 k, M, G 等单位表示大小，否则默认是字节，不容易阅读。

```sh
[alvin@VM_0_16_centos ~]$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/vda1        50G  7.5G   40G  16% /
devtmpfs        911M     0  911M   0% /dev
tmpfs           920M   68K  920M   1% /dev/shm
tmpfs           920M  364K  920M   1% /run
tmpfs           920M     0  920M   0% /sys/fs/cgroup
tmpfs           184M     0  184M   0% /run/user/0
tmpfs           184M     0  184M   0% /run/user/1001
tmpfs           184M     0  184M   0% /run/user/1000
```