# while 循环
while循环用于不断执行一系列命令，也用于从输入文件中读取数据；命令通常为测试条件。其格式为：

```sh
while condition
do
    command1
    ...
    commandN
done
```

```sh
[root@dell_tower ~]# a=1
[root@dell_tower ~]# while [ $a -lt 10 ]
> do
> echo $a
> (( a++ ))
> done
1
2
3
4
5
6
7
8
9
[root@dell_tower ~]#  
```
```sh
# 一个Inspur的例子
local opid=""
local opid_len=5
while true
do
    _green_echo -n "Please Input the Operator Number: "
    read opid
    opid=`echo $opid | tr '[a-z]' '[A-Z]'`
    echo "opid=$opid"		
    if [ "${#opid}" -ne "$opid_len" ]
    then
        _red_echo "OPID length error,Please input again!"
    else
        echo $opid > $tmp_dir/opid
        break
    fi
done
```

使用 while 遍历文件的每一行，然后将每行内容输出。
```sh
[root@dell_tower ~]# cat abd
abc
Haha nihao
Nice to meet you
You are so beautiful.
Bye
[root@dell_tower ~]# cat abd | while read line; do echo $line; done
abc
Haha nihao
Nice to meet you
You are so beautiful.
Bye
[root@dell_tower ~]# cat abd | while read line; do echo \"$line\"; done
"abc"
"Haha nihao"
"Nice to meet you"
"You are so beautiful."
"Bye"
[root@dell_tower ~]#
```
```sh
[root@dell_tower ~]# while read line; do echo $line; done <abd
abc
Haha nihao
Nice to meet you
You are so beautiful.
Bye
[root@dell_tower ~]#
```


