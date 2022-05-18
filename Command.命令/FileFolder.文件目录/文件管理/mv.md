# mv  文件/目录的移动或更名

mv是移动 move 的意思！可以用来移动文件或目录。  
另外一个用途就是“变更文件名”，我们可以很轻易的使用 mv 来变更一个文件的文件名！


参数
| 短  | 长                     | 描述                                                                                         |
| --- | ---------------------- | -------------------------------------------------------------------------------------------- |
| -b  |                        | 若需覆盖文件，则覆盖前先行备份。                                                             |
| -f  | --force                | force 强制的意思，如果目标文件已经存在，不会询问而直接覆盖；                                 |
| -i  | --interactive          | 若目标文件 (destination) 已经存在时，就会询问是否覆盖！                                      |
| -n  | --no-clobber           | 不会覆盖已经存在的文件                                                                       |
| -u  | --update               | 若目标文件已经存在，且 source 比较新，才会更新(update)                                       |
| -t  | --target-directory=DIR | 指定mv的目标目录，该选项适用于移动多个源文件到一个目录的情况，此时目标目录在前，源文件在后。 |
| -v  | --verbose              | 详细显示进行的步骤。                                                                         |
|     | --help                 | 显示此帮助信息并退出。                                                                       |
|     | --version              | 输出版本信息并退出。                                                                         |




Linux指令中，`rename`也可以用来更改文件名，可以用`man rename`来查阅帮助！

```sh
[root@study ~]# mv [-fiu] source destination
[root@study ~]# mv [options] source1 source2 source3 .... directory
选项与参数：
-f  ：force 强制的意思，如果目标文件已经存在，不会询问而直接覆盖；
-i  ：若目标文件已经存在时，就会询问是否覆盖！
-u  ：若目标文件已经存在，且源文件比较新，才会更新 update。
```
```sh
# Sample: 复制一文件，创建一目录，将文件移动到目录中
[root@study ~]# cd /tmp
[root@dell_tower tmp]# cp ~/.bashrc bashrc
[root@dell_tower tmp]# mkdir folder_test
[root@dell_tower tmp]# mv bashrc folder_test/
# 将某个文件移动到某个目录去，就是这样做！

# Sample: 将刚刚的目录名称更名为 folder_test2
[root@dell_tower tmp]# mv folder_test/ folder_test2/
# 其实 rename 也可以重命名
# 该指令专职进行多个文件名的同时更名，并非针对单一文件名变更，与mv不同。请man rename。

# Sample: 再创建两个文件，再全部移动到 /tmp/folder_test2 当中
[root@dell_tower tmp]# cp ~/.bashrc bashrc1
[root@dell_tower tmp]# cp ~/.bashrc bashrc2
[root@dell_tower tmp]# mv bashrc1 bashrc2 folder_test2/
# 注意到这边，如果有多个来源文件或目录，则最后一个目标文件一定是“目录！”
# 意思是说，将所有的数据移动到该目录的意思！
[root@dell_tower tmp]# ll folder_test2/
total 12
-rw-r--r-- 1 root root 176 Oct 29 14:17 bashrc
-rw-r--r-- 1 root root 176 Oct 29 14:18 bashrc1
-rw-r--r-- 1 root root 176 Oct 29 14:18 bashrc2
[root@dell_tower tmp]#
```






## ref
* []()
* []()
* []()
* []()
* []()

