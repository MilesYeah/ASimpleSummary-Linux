

## rm 移除文件或目录

这是移除的指令 `rm: remove`

```sh
[root@study ~]# rm [-fir] 文件或目录
选项与参数：
-f  ：就是 force 的意思，忽略不存在的文件，不会出现警告讯息；
-i  ：互动模式，在删除前会询问使用者是否动作
-r  ：递回删除啊！最常用在目录的删除了！这是非常危险的选项！！！
```

通常在Linux系统下，怕文件被 root 误杀，很多 Linux 厂商都默认加入 `-i` 这个选项在删除之前确认！  
如果要连子目录的内容一起杀掉的话，那就使用 `-r` 这个选项！请千万注意，此时系统不会再次询问是否要砍掉该文件！  
如果你确定该目录不要了，那么使用 `rm -r` 来循环删除是不错的方式！

```sh
# Sample: 删除 bashrc ！
[root@dell_tower ~]# cd /tmp
[root@dell_tower tmp]# touch bashrc
[root@dell_tower tmp]# rm -i bashrc
rm: remove regular file 'bashrc'? y
# 如果加上 -i 的选项就会主动询问，避免你删除到错误的文件名！

# Sample: 通过万用字符*的帮忙，将/tmp下面开头为bashrc的文件名通通删除：
[root@dell_tower tmp]# rm -i bashrc*
# 注意那个星号，代表的是 0 到无穷多个任意字符！很好用的东西！

# Sample: 删除 /tmp/etc 下的多个文件
[root@dell_tower tmp]# mkdir etc
[root@dell_tower tmp]# touch etc/f1 etc/f2 etc/f3 etc/f4
[root@dell_tower tmp]# rmdir /tmp/etc
rmdir: failed to remove '/tmp/etc': Directory not empty   <== 删不掉！因为这不是空的目录！
[root@dell_tower tmp]# rm -r /tmp/etc/
rm: descend into directory ‘/tmp/etc/’? y
rm: remove regular empty file ‘/tmp/etc/f1’? y
rm: remove regular empty file ‘/tmp/etc/f2’? y
rm: remove regular empty file ‘/tmp/etc/f3’? y^C    <== 按下 [crtl]+c 中断
[root@dell_tower tmp]# ll etc/
total 0
-rw-r--r-- 1 root root 0 Oct 29 14:10 f3
-rw-r--r-- 1 root root 0 Oct 29 14:10 f4
# 因为身份是 root ，默认已经加入了 -i 的选项，所以你要一直按 y 才会删除！
# 如果不想要继续按 y ，可以按下“ [ctrl]-c ”来结束 rm 的工作。
# 这是一种保护的动作，如果确定要删除掉此目录而不要询问，可以这样做：

[root@dell_tower tmp]# \rm -r /tmp/etc
# 在指令前加上反斜线，可以忽略掉 alias 的指定选项！
```



