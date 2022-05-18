# tee


## tee 与上条命令的返回值

### sample 1
BASH SHELL中，通常使⽤ $? 来获取上⼀条命令的返回码。
最后⼀条命令的返回码
对于管道中的命令，使⽤$?只能获取管道中，例如

下⾯的例⼦中/not/a/valid/filename是⼀个不存在的⽂件
```sh
cat /not/a/valid/filename | cat
```
第⼀个cat失败，第⼆个cat成功，所以$?的值为0

这种情况下，可以使⽤ $PIPESTATUS来获取管道中每个命令的返回码。

注意：
1. PIPESTATUS 是⼀个数组，第⼀条命令的返回码存储在${PIPESTATUS[0]}，以此类推，上例中执⾏完管道中所有的命令后，PIPESTATUS数组第⼀个元素值为1，第⼆个元素值为0
2. 如果前⼀条命令不是⼀个管道，⽽是⼀个单独的命令，命令的返回码存储为${PIPESTATUS[0]}，此时${PIPESTATUS[0]}同$?值相同（事实上，PIPESTATUS最后⼀个元素的值总是与$?的值相同）
3. 每执⾏⼀条命令，切记PIPESTATUS都会更新其值为上⼀条命令的返回码，
    ```sh
    cat /not/a/valid/filename|cat
    if [ ${PIPESTATUS[0]} -ne 0 ]; then 
        echo ${PIPESTATUS[@]}; 
    fi
    ```
上例中执⾏完管道后，`${PIPESTATUS[0]}`值为1，`${PIPESTATUS[1]}`值为0

但是上⾯的脚本执⾏完成后，输出为0，这是因为if 分⽀的测试命令

```sh
[root@test output]# cat a.sh 
#!/bin/sh 
a=3 
if [ $a -gt 4 ] 
then 
    echo "1111111" 
    exit 1 
fi 
echo "222222" 
exit 0 
[root@test output]# cat b.sh 
#!/bin/sh 
sh a.sh | tee >>a.log 
aa=${PIPESTATUS[0]} 
if [ $aa -ne 0 ] 
then 
    echo "aaaaaaaaaaaaaaaa" 
fi
```


### sample 2
```sh
[root@localhost ~]# echo exit 1 > return1.sh
[root@localhost ~]# echo exit 2 > return2.sh
[root@localhost ~]# echo exit 3 > return3.sh
[root@localhost ~]# 
[root@localhost ~]# ./return1.sh | ./return2.sh | ./return3.sh | tee log; echo ${PIPESTATUS[@]}
1 2 3 0
[root@localhost ~]#
[root@localhost ~]# ./return1.sh | ./return3.sh | ./return2.sh | tee log; echo ${PIPESTATUS[@]}
1 3 2 0
[root@localhost ~]# 
[root@localhost ~]# ./return1.sh | ./return2.sh | ./return3.sh | tee log
[root@localhost ~]# echo ${PIPESTATUS[0]}
1
[root@localhost ~]# echo ${PIPESTATUS[1]}

[root@localhost ~]# echo ${PIPESTATUS[2]}

[root@localhost ~]# echo ${PIPESTATUS[3]}

[root@localhost ~]# 
[root@localhost ~]# ./return1.sh | ./return2.sh | ./return3.sh | tee log
[root@localhost ~]# echo ${PIPESTATUS[@]}
1 2 3 0
[root@localhost ~]# echo ${PIPESTATUS[2]}

[root@localhost ~]# 
```



## ref
* [作者：乐正浩宕资料集合分享](https://wenku.baidu.com/view/8e451ecb49fe04a1b0717fd5360cba1aa8118c60.html)
* []()
* []()
* []()
* []()
* []()
* []()
* []()

