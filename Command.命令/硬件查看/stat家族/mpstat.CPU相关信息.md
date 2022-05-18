# mpstat.CPU相关信息

## 介绍
输出 CPU 相关信息

 

### mpstat 主要能看什么性能指标
* 每个 CPU 的不同类型 CPU 使用率、不同软中断类型次数统计、总中断次数
* 上述所有 CPU 的平均数据
 

## 语法格式
```sh
mpstat [ -A ] [ -n ] [ -u ] [ -V ] [ -I { keyword [,...] | ALL } ] [ -N { node_list | ALL } ] [ -o JSON] [ -P { cpu_list | ON | ALL } ] [ interval [ count ] ]
```
* interval ：间隔多久统计一次数据，可选
* count：统计一次，可选
* 注意：若只传了 interval ，则统计次数是无限次，结束统计后会打印本次所有数据的平均值
 

小栗子
mpstat 1 
每隔 1s 统计打印一次数据，统计无限次

 

mpstat 2 5
每隔 2s 统计打印一次数据，共统计 5 次

 

## 统计信息的字段说明
最基础的命令

mpstat 1 2


 

### 字段说明


 

### 命令行参数


 

### -P { cpu_list | ON | ALL }
作用
* 指定要报告其统计信息的 CPU
* cpu_list：是用 , 分隔的值或值范围的列表（例如 0,2,4-7,0-1 ）
* ON：将为每个联机 CPU 报告统计信息
* ALL：将为所有 CPU 报告统计信息
 

### cpu_list 的栗子
只指定 CPU1

mpstat -P 1 1 2


 

指定CPU0、CPU1

mpstat -P 0-1 1 2


 

### ON 的栗子
mpstat -P ON 1 2


 

### ALL 的栗子
mpstat -P ALL 1 2


 

## 重点
0 是第一个 CPU
all 是所有处理器之间的全局平均值
 

### `-I { keyword [,...] | ALL }`
作用
* 输出中断统计信息
* keyword 可以输入：CPU、SCPU、SUM、ALL
* CPU：显示每秒中断数量，从 /proc/interrupts 读取数据
* SCPU：显示每秒软中断数量，从 /proc/softirqs 读取数据
* SUM：显示每个处理器的中断总数
* ALL：输出上面三个关键字的所有内容
 

### SCPU 的栗子
mpstat -I SCPU 1 2 -P ALL


 

### SUM 的栗子
显示所有 CPU 平均中断次数

mpstat -I SUM 1 2


 

显示每个 CPU 的中断次数、所有 CPU 平均中断次数

mpstat -I SCPU 1 2 -P ALL









本文作者： 小菠萝测试笔记
本文链接： https://www.cnblogs.com/poloyy/p/13492584.html
