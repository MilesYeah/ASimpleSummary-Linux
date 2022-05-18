# modprobe.驱动

Linux modprobe命令用于自动处理可载入模块。

modprobe可载入指定的个别模块，或是载入一组相依的模块。modprobe会根据depmod所产生的相依关系，决定要载入哪些模块。若在载入过程中发生错误，在modprobe会卸载整组的模块。


## 语法
modprobe [-acdlrtvV][--help][模块文件][符号名称 = 符号值]


## 参数：

| short | long        | 描述                             |
| ----- | ----------- | -------------------------------- |
| -a    | --all       | 载入全部的模块。                 |
| -c    | --show-conf | 显示所有模块的设置信息。         |
| -d    | --debug     | 使用排错模式。                   |
| -l    | --list      | 显示可用的模块。                 |
| -r    | --remove    | 模块闲置不用时，即自动卸载模块。 |
| -t    | --type      | 指定模块类型。                   |
| -v    | --verbose   | 执行时显示详细的信息。           |
| -V    | --version   | 显示版本信息。                   |
|       | -help       | 显示帮助。                       |


## 实例
1. 安装软驱模块：
   1. [root@w3cschool.cc ~]# modprobe -v floppy 
2. 卸载软驱模块：
   1. [root@w3cschool.cc ~]# modprobe -v -r floppy 




