

## 文件格式在Windows/Linux/MAC间的转换

* `dos2unix`: 将文件格式从 Windows 转为 Linux
* `unix2dos`: 将文件格式从 Linux 转为 Windows 
* `unix2mac`: 将文件格式从 Linux 转为 MAC
* `mac2unix`: 将文件格式从 MAC 转为 Linux

可能有些人觉得在Linux下编辑文件是一件很痛苦的事情，所以有时候大家会选择在Windows下将文件编辑好，然后复制到Linux下使用。  
但由于换行字符在Windows/Linux并不相同：Windows的换行符是`^M$`, 而Linux则是`$`。  
如果从Linux下复制一份文件到Windows下，用普通文本编辑器打开时，所有内容都缩到一起，完全没法看。  
那么在这种情况下，我们需要使用以上四条命令将文件格式转换为正确的格式后再继续使用。

```sh
# Sample 1
[root@dell_tower miles]# echo aaaaaaaaaaaaaaaaaa > fileformat
[root@dell_tower miles]# file fileformat
fileformat: ASCII text
# 输出fileformat文件的所有内容，可见Linux下文件的行尾换行符为 $
[root@dell_tower miles]# cat -A fileformat
aaaaaaaaaaaaaaaaaa$

# 将文件转换成为 Windows格式
[root@dell_tower miles]# unix2dos fileformat; file fileformat
unix2dos: converting file fileformat to DOS format ...
fileformat: ASCII text, with CRLF line terminators

# 输出fileformat文件的所有内容，可见Windows格式文件的行尾换行符为 ^M$
[root@dell_tower miles]# cat -A fileformat
aaaaaaaaaaaaaaaaaa^M$

# 将文件由Windows格式还原成Linux格式
[root@dell_tower miles]# dos2unix fileformat; file fileformat
dos2unix: converting file fileformat to Unix format ...
fileformat: ASCII text
[root@dell_tower miles]# cat -A fileformat
aaaaaaaaaaaaaaaaaa$
```

```sh
# Sample 2
# 编写一个简单的 Hello world脚本，并查看其内容
[root@dell_tower miles]# cat test_script.sh
#!/bin/bash
echo Hello world!

[root@dell_tower miles]# file test_script.sh
test_script.sh: Bourne-Again shell script, ASCII text executable
[root@dell_tower miles]# chmod a+x test_script.sh

# 赋予执行权限后执行该脚本，可正常执行
[root@dell_tower miles]# ./test_script.sh
Hello world!

# 转换成Windows格式
[root@dell_tower miles]# unix2dos test_script.sh
unix2dos: converting file test_script.sh to DOS format ...

# 执行时，shell提示未找到解释器
[root@dell_tower miles]# ./test_script.sh
bash: ./test_script.sh: /bin/bash^M: bad interpreter: No such file or directory
```



