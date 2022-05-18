## Linux [删除除某个文件之外的所有文件](https://blog.csdn.net/wqhjfree/article/details/16800253)

Bash Shell有个extglob选项，开启之后Shell可以另外识别出5个模式匹配操作符，能使文件匹配更加方便。
* 开启，使用shopt命令：shopt -s extglob
* 关闭，使用shopt命令：shopt -u extglob

开启之后，以下5个模式匹配操作符将被识别：
* ?(pattern-list) - 所给模式匹配0次或1次；
* *(pattern-list) - 所给模式匹配0次以上包括0次；
* +(pattern-list) - 所给模式匹配1次以上包括1次；
* @(pattern-list) - 所给模式仅仅匹配1次；
* !(pattern-list) - 不匹配括号内的所给模式。
 
不知你是否想过在Linux命令行上，如何实现删除除了某个文件之外的所有文件？
如abc文件夹下有a、b、c三个文件，如何一行命令删除b和c,不删除a。有位童鞋在工作经常有此需求，本文将介绍其他童鞋提供的实现方法。
其中rm -f  !(a) 最为方便。如果保留a和b,可以运行rm -f !(a|b)来实现。

不过一般bash中运行后会提示 “-bash: !: event not found ” 可以通过运行shopt -s extgolb来解决。如下：
```sh
[root@localhost abc]# rm -f !(a)

-bash: !: event not found

[root@localhost abc]# shopt -s extglob

[root@localhost abc]# rm -f !(a)
[root@localhost abc]# ls
a
[root@localhost abc]# touch b c d
[root@localhost abc]# rm -f !(a|b)

[root@localhost abc]# ls
a  b
另外也可以使用下面的方法：
[root@localhost abc]# ls
a  b  c
[root@localhost abc]# ls |grep -v a |xargs rm -f 

[root@localhost abc]# ls
a
```
