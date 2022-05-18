# stress 

Linux 系统压力测试工具，这里通过异常进程模拟平均负载升高的场景

 

stress 命令行参数的讲解

| 字段                | 含义                                                     |
| ------------------- | -------------------------------------------------------- |
| `-?、--help`        | 帮助文档                                                 |
| `--version、-v`     | 版本号                                                   |
| `-q`                | 退出                                                     |
| `-n`                | 显示已完成指令的情况                                     |
| `-t N、--timeout N` | 运行 N 秒后停止                                          |
| `--backoff N`       | 等待 N 微秒后开始运行                                    |
| `-c N、--cpu N`     |
|                     | 产生 N 个进程                                            |
|                     | 每个进程反复的计算随机数的平方根                         |
|                     | 模拟 CPU 计算密集型场景                                  |
| `-i N、--io N`      |
|                     | 产生 N 个进程                                            |
|                     | 每个进程反复调用 sync()                                  |
|                     | 模拟 I/O 密集型场景                                      |
| `-m N、--vm N`      |
|                     | 产生 N 个进程                                            |
|                     | 每个进程不断调用内存分配 malloc() 和内存释放 free() 函数 |
| `--vm-bytes B`      |
|                     | 指定 malloc() 时内存的字节数，默认256MB                  |
| `--vm-hang N`       | 指定执行 free() 前等待的秒数                             |
| `-d N、 --hdd N`    |
|                     | 产生 N 个进程                                            |
|                     | 每个进程执行 write() 和 unlink() 的进程                  |
| `--hdd-bytes B`     |
|                     | 每个 hdd worker 写入 B 字节（默认为1GB）                 |

 

Numbers may be suffixed with s,m,h,d,y (time) or B,K,M,G (size)
时间单位可以为秒 s，分m，小时h，天d，年y，文件大小单位可以为 K，M，G


## ref

本文作者： 小菠萝测试笔记
本文链接： https://www.cnblogs.com/poloyy/p/13325507.html
关于博主： 阿里高级测开工程师 - 让我装回杯

