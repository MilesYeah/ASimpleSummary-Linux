# vmstat.虚拟内存统计

## 介绍
Virtual Meomory Statistics，报告虚拟内存统计信息

会统计进程信息、内存、交换区、IO、磁盘、CPU 等数据
 

### vmstat主要能看什么性能指标
均是 Linux 系统级别
* 运行状态、不可中断睡眠状态的进程数量
* 内存、交换区、I/O、CPU 信息
* 上下文切换次数、中断次数
* 磁盘 I/O 的详细信息和概要信息



## 语法格式
```
vmstat [options] [delay [count]]
```
* options：命令行参数，可选
* delay：间隔多久统计一次数据，可选
* count：统计一次，可选
* 注意：若只传了 delay，则统计次数是无限次，结束统计后会打印本次所有数据的平均值
 

小栗子
vmstat 1 
每隔 1s 统计打印一次数据，统计无限次

 

vmstat 2 5
每隔 2s 统计打印一次数据，共统计 5 次

 

## 命令行参数


 

## 统计数据的字段说明 


共有 6 个模块

 

### procs：进程状态


 

### memory：内存信息


 

### swap：交换区


 

### io：io 读写信息
现在的Linux版本块的大小为1024bytes



 

### system：系统信息


 

### CPU：CPU 详细信息
这些是总 CPU 时间的百分比



 

## 数据来源
主要来自这三个文件
* /proc/meminfo
* /proc/stat
* /proc/*/stat
 

vmstat


这些信息主要来自 /proc/stat 

 

vmstat -s 


这些信息的分别来自于 /proc/meminfo 、 /proc/stat 和 /proc/vmstat 

 

vmstat -d


这些信息主要来自于 /proc/diskstats 

 

## 其他用法
### 打印活动内存和不活动内存量
vmstat -a 2 2


 

### 以 MB 单位输出结果
vmstat -S M 1 2


 

### 以 MB 单位输出各事件计数器和内存的统计信息
vmstat -s -S M 


 

## 注意事项
1. vmstat 不需要特殊权限
2. vmstat 报告旨在帮助确定系统瓶颈，所以它不会将自己视为正在运行的进程
3. 当前所有的 Linux 块都是 1024 字节， 旧内核可能报告的块为 512 字节，2048 字节或 4096 字节




本文作者： 小菠萝测试笔记
本文链接： https://www.cnblogs.com/poloyy/p/13434155.html
