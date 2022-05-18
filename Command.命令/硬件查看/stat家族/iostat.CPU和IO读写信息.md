# iostat 

## 介绍
报告 CPU 信息和 I/O 读写信息

 

iostat 主要能看什么性能指标
系统 CPU 使用率
设备的磁盘使用情况
 

## 语法格式
```sh
iostat [ -c ] [ -d ] [ -h ] [ -k | -m ] [ -N ] [ -s ] [ -t ] [ -V ] [ -x ] [ -y ] [ -z ]  [-j  { ID | LABEL | PATH | UUID | ... } ] [ -o JSON ] [ [ -H ] -g group_name ] [ --human ] [-p [ device [,...] | ALL ] ] [ device [...] | ALL ] [ interval [ count ] ]
```
* interval：间隔多久统计一次数据，可选
* count：统计一次，可选
* 注意：若只传了 interval，则统计次数是无限次，结束统计后会打印本次所有数据的平均值
 

小栗子
iostat 1 
每隔 1s 统计打印一次数据，统计无限次

 

iostat 2 5
每隔 2s 统计打印一次数据，共统计 5 次

 

## 默认输出显示的字段说明
最基础的命令

iostat 1 2 


分为两个部分：系统 CPU 信息，设备的 I/O 读写信息

 

### 系统 CPU 信息字段说明


 

### 设备的 I/O 读写信息字段说明


 

## 命令行参数


 


### 定时显示所有信息
iostat 2  3
 

### 只显示系统 CPU 信息，并伴随着时间戳
iostat -t -c


 

### 只显示指定磁盘的统计信息
iostat -d sda


 

### 显示指定磁盘和他所有分区的信息，并友好显示
iostat -p sda -h


 

### 整合所有设备的磁盘信息
iostat -g all_device


每项都是前面所有设备数据的总和

 

### 整合所有设备的磁盘信息，并只显示总的数据
iostat -g all_device -H


 

### 忽略没有活动的设备的统计信息
iostat -z 1 2


可以发现，第一次输出的时候没有活动的设备还是会打印出来，怎么解决？

 

### 忽略没有活动的设备的统计信息和第一次统计的信息
iostat -z -y 1 2


完美解决上面的问题啦

 

### 显示更详细的统计信息
iostat -x -d 1 2 -y -z


 

### 字段说明


 

## 重点
如果 %util 接近 100%，说明产生的I/O请求太多，I/O系统已经满负荷，该磁盘可能存在瓶颈

 



本文作者： 小菠萝测试笔记
本文链接： https://www.cnblogs.com/poloyy/p/13496349.html


