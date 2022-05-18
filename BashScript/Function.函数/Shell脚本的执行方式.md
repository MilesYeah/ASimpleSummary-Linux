# 执行Shell 脚本的执行方式

Shell 脚本的执行方式通常有如下三种：
1. `bash script-name` 或 `sh script-name`：
    1. 这是当脚本文件本身没有可执行权限（即文件权限属性x位为-号）时常使用的方法，
    2. 或者脚本文件开头没有指定解释器时需要使用的方法。
2. `abspath/script-name` 或 `./script-name`：
    1. 指在当前路径下执行脚本，需要在执行前赋予脚本执行权限。具体方法为:`chmod a+x script-name`。
    2. 然后通过执行脚本绝对路径或者相对路径就可以执行脚本了。
    3. 注意：在生产环境中，工程人员有时由于忘记为该脚本赋予可执行权限，然后直接使用，导致出错。
3. `source script-name` 或 `. script-name`：
    1. `source`或者`.`命令的功能是：`读入脚本`并`执行脚本`。
    2. 即在当前Shell中执行`source`或`.`加载并执行脚本文件中的的命令及语句，
    3. 不产生一个子 Shell 来执行文件中的命令，这是和其他几种执行 shell 方式的最大不同。


如在 `/root/miles` 下的 `show_paras.sh` 脚本可以通过如下的方式来执行。
```sh
[root@dell_tower miles]# pwd show_paras.sh
/root/miles
[root@dell_tower miles]# cat show_paras.sh
#!/bin/bash
echo "para count: $#"
echo "script name: $0"
echo "para 1: $1"
echo "para 2: $2"
echo "process id: $$"
echo "last cmd exit status: $?"
echo "Show $@:"
for item in $@; do echo ${item}; done
echo "Show $*:"
for item in $*; do echo ${item}; done
echo "Show \"$@\":"
for item in "$@"; do echo ${item}; done
echo "Show \"$*\":"
for item in "$*"; do echo ${item}; done
[root@dell_tower miles]#
```
```sh
[root@dell_tower miles]# bash show_paras.sh
para count: 0
script name: show_paras.sh
para 1:
para 2:
process id: 17427
last cmd exit status: 0
Show :
Show :
Show "":
Show "":

[root@dell_tower miles]# sh show_paras.sh
para count: 0
script name: show_paras.sh
para 1:
para 2:
process id: 17433
last cmd exit status: 0
Show :
Show :
Show "":
Show "":

[root@dell_tower miles]# /root/miles/show_paras.sh
para count: 0
script name: /root/miles/show_paras.sh
para 1:
para 2:
process id: 17439
last cmd exit status: 0
Show :
Show :
Show "":
Show "":

[root@dell_tower miles]# ./show_paras.sh
para count: 0
script name: ./show_paras.sh
para 1:
para 2:
process id: 17446
last cmd exit status: 0
Show :
Show :
Show "":
Show "":

[root@dell_tower miles]# source show_paras.sh
para count: 0
script name: -bash
para 1:
para 2:
process id: 16799
last cmd exit status: 0
Show :
Show :
Show "":
Show "":

[root@dell_tower miles]# . show_paras.sh
para count: 0
script name: -bash
para 1:
para 2:
process id: 16799
last cmd exit status: 0
Show :
Show :
Show "":
Show "":

[root@dell_tower miles]#
```




