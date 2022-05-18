# for 循环
与其他编程语言类似，Shell支持for循环。

## 语法

### for循环一般格式为：
```sh
for var in item1 item2 ... itemN
do
    command1
    ...
    commandN
done
```


### 写成一行：
```sh
for var in item1 item2 ... itemN; do command1; …; commandN; done;
```

in 列表是一组值（数字、字符串等）组成的序列，每个值通过空格分隔。
command 命令可为任何有效的shell命令和语句。
for循环依次遍历N个item，每获取一个item就执行一次所有命令(从 command1 到 commandN)。  


### 使用类似 C 格式
```sh
for ((i=1; i<=${BOOT_COUNT}; i++))
do 
    command1
    ...
    commandN
done
```

```sh
[root@localhost ~]# BOOT_COUNT=5
[root@localhost ~]# for ((i=0; i<=${BOOT_COUNT}; i++))
> do
> echo $i
> done
0
1
2
3
4
5
[root@localhost ~]# 
```




## eg
### 列出当前目录下文件
```sh
[root@dell_tower temp]# ll
total 0
drwxr-xr-x 2 root root 6 Nov 30 10:14 cptest
-rw-r--r-- 1 root root 0 Nov 30 10:14 f1
-rw-r--r-- 1 root root 0 Nov 30 10:14 f2

[root@dell_tower temp]# for file in $(ls)
> do
> echo ${file}
> done
cptest
f1
f2
[root@dell_tower temp]# 
```
```sh
#一个Inspur的例子
for i in "$@"
do
    case $i in
    --sn*)
        sn=${i/*=/}
        ;;
    esac
done
```

