# pidstat.进程线程统计

## 介绍
* 对 Linux 任务的统计
* 主要用于监控全部或指定进程占用系统资源的情况，如CPU，内存、设备IO、任务切换、线程等
 

### pidstat 主要能看什么性能指标
均是进程、线程级别



 

## 语法格式
```sh
pidstat [ -C comm ] [ -d ] [ -h ] [ -I ] [ -l ] [ -p { pid [,...] | SELF | ALL } ] [ -r ] [ -t ] [ -T { TASK | CHILD | ALL } ] [ -u ] [ -V ] [ -w ] [ interval [ count ] ]
```
* interval ：间隔多久统计一次数据，可选
* count：统计一次，可选
* 注意：若只传了 interval ，则统计次数是无限次，结束统计后会打印本次所有数据的平均值
 

小栗子
pidstat 1 
每隔 1s 统计打印一次数据，统计无限次

 

pidstat 2 5
每隔 2s 统计打印一次数据，共统计 5 次

 

### 查看活动进程的 CPU 统计信息
pidstat 1 2
pidstat -u 1 2
默认就是 -u



字段说明


 

### 查看活跃进程的 I/O 读写情况
pidstat -d 1 10


字段说明


 

### 查看活跃进程的上下文切换次数
pidstat -w 1 5


字段说明


 

### 查看活跃进程的内存使用情况
pidstat -r 1 5


字段说明


 

### 查看活跃进程的堆栈利用率
pidstat -s 1 2


字段说明


 

### 其他可选的命令行参数
#### -U [ username ]
作用
默认显示的是 UID，如果加了这个参数，则会显示每个进程所属的用户名
如果指定了 username，则只会打印属于这个 username 的进程
 

栗子
pidstat -U 1 2


 

指定 username 的栗子
pidstat -U root 1 2


 

#### -p
作用
只显示指定进程号的信息

 

栗子
pidstat -p 124 1 2


 

#### -t
作用
显示进程关联的线程的统计信息

 

栗子
pidstat -t 1 5


TGID：主进程 ID
TID：进程下的各个子线程 ID
 

#### -l
作用
详细的输出进程命令和所有参数

 

栗子
pidstat -l 1 1


 

#### --human
作用
人性化的输出大小

 

栗子
pidstat -d --human 1 2


 

#### -G process_name
作用
仅显示命令名称包含字符串 process_name 的进程
该字符串可以是正则表达式
如果选项 -t 与选项 -G 一起使用，则还将显示属于该进程的线程（即使它们的命令名不包括字符串process_name）
 

栗子
pidstat -t -G pidstat 1 2


 

本文作者： 小菠萝测试笔记
本文链接： https://www.cnblogs.com/poloyy/p/13447929.html