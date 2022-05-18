# free

free命令可以查看系统中使用的、闲置的和 RAM 的总体数量，一般带上 -m 参数。


```sh
[alvin@VM_0_16_centos ~]$ free -m
              total        used        free      shared  buff/cache   available
Mem:           1839         221         156           0        1461        1400
Swap:             0           0           0
```

```sh
[root@RHEL7CCIE yum.repos.d]# free -h
             total       used       free     shared    buffers     cached
Mem:          1.8G       842M       997M       9.3M       880K       287M
-/+ buffers/cache:       554M       1.3G
Swap:         2.0G         0B       2.0G
[root@RHEL7CCIE yum.repos.d]#
```

|                    | 内存总量 | 已用量 | 可用量 | 进程共享的 | 磁盘缓存的 | 缓存的内存量 |
| ------------------ | -------- | ------ | ------ | ---------- | ---------- | ------------ |
|                    | total    | used   | free   | shared     | buffers    | cached       |
| Mem:               | 1.8G     | 842M   | 997M   | 9.3M       | 880K       | 287M         |
| -/+ buffers/cache: |          | 554M   | 1.3G   |            |            |              |
| Swap:              | 2.0G     | 0B     | 2.0G   |            |            |              |


