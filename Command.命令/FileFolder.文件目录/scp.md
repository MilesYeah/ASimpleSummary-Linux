# scp

scp（secure copy）是一个基于SSH协议在网络之间进行安全传输的命令，其格式为“scp [参数] 本地文件 远程帐户@远程IP地址:远程目录”。

与第2章讲解的cp命令不同，cp命令只能在本地硬盘中进行文件复制，而scp不仅能够通过网络传送数据，而且所有的数据都将进行加密处理。
例如，如果想把一些文件通过网络从一台主机传递到其他主机，这两台主机又恰巧是Linux系统，这时使用scp命令就可以轻松完成文件的传递了。


scp命令中可用的参数及作用

| 参数 | 作用                     |
| ---- | ------------------------ |
| -v   | 显示详细的连接进度       |
| -P   | 指定远程主机的sshd端口号 |
| -r   | 用于传送文件夹           |
| -6   | 使用IPv6协议             |


参数说明：
| 参数             | 作用                                                                                            |
| ---------------- | ----------------------------------------------------------------------------------------------- |
| -1               | 强制scp命令使用协议ssh1                                                                         |
| -2               | 强制scp命令使用协议ssh2                                                                         |
| -4               | 强制scp命令只使用IPv4寻址                                                                       |
| -6               | 强制scp命令只使用IPv6寻址                                                                       |
| -B               | 使用批处理模式（传输过程中不询问传输口令或短语）                                                |
| -C               | 允许压缩。（将-C标志传递给ssh，从而打开压缩功能）                                               |
| -p               | 保留原文件的修改时间，访问时间和访问权限。                                                      |
| -q               | 不显示传输进度条。                                                                              |
| -r               | 递归复制整个目录。                                                                              |
| -v               | 详细方式显示输出。scp和ssh(1)会显示出整个过程的调试信息。这些信息用于调试连接，验证和配置问题。 |
| -c cipher        | 以cipher将数据传输进行加密，这个选项将直接传递给ssh。                                           |
| -F ssh_config    | 指定一个替代的ssh配置文件，此参数直接传递给ssh。                                                |
| -i identity_file | 从指定文件中读取传输时使用的密钥文件，此参数直接传递给ssh。                                     |
| -l limit         | 限定用户所能使用的带宽，以Kbit/s为单位。                                                        |
| -o ssh_option    | 如果习惯于使用ssh_config(5)中的参数传递方式，                                                   |
| -P port          | 注意是大写的P, port是指定数据传输用到的端口号                                                   |
| -S program       | 指定加密传输时所使用的程序。此程序必须能够理解ssh(1)的选项。                                    |

实例

## 从本地复制到远程
命令格式：
```sh
scp local_file remote_username@remote_ip:remote_folder 
或者 
scp local_file remote_username@remote_ip:remote_file 
或者 
scp local_file remote_ip:remote_folder 
或者 
scp local_file remote_ip:remote_file 
```
* 第1,2个指定了用户名，命令执行后需要再输入密码，第1个仅指定了远程的目录，文件名字不变，第2个指定了文件名；
* 第3,4个没有指定用户名，命令执行后需要输入用户名和密码，第3个仅指定了远程的目录，文件名字不变，第4个指定了文件名；

应用实例：
```sh
scp /home/space/music/1.mp3 root@www.runoob.com:/home/root/others/music 
scp /home/space/music/1.mp3 root@www.runoob.com:/home/root/others/music/001.mp3 
scp /home/space/music/1.mp3 www.runoob.com:/home/root/others/music 
scp /home/space/music/1.mp3 www.runoob.com:/home/root/others/music/001.mp3 
```

复制目录命令格式：
```sh
scp -r local_folder remote_username@remote_ip:remote_folder 
或者 
scp -r local_folder remote_ip:remote_folder 
```
第1个指定了用户名，命令执行后需要再输入密码；
第2个没有指定用户名，命令执行后需要输入用户名和密码；

应用实例：
```sh
scp -r /home/space/music/ root@www.runoob.com:/home/root/others/ 
scp -r /home/space/music/ www.runoob.com:/home/root/others/ 
```

上面命令将本地 music 目录复制到远程 others 目录下。


## 从远程复制到本地
从远程复制到本地，只要将从本地复制到远程的命令的后2个参数调换顺序即可，如下实例

应用实例：
```sh
scp root@www.runoob.com:/home/root/others/music /home/space/music/1.mp3 
scp -r www.runoob.com:/home/root/others/ /home/space/music/
```

说明
1. 如果远程服务器防火墙有为scp命令设置了指定的端口，我们需要使用 -P 参数来设置命令的端口号，命令格式如下：
    ```
    #scp 命令使用端口号 4588
    scp -P 4588 remote@www.runoob.com:/usr/local/sin.sh /home/administrator
    ```
2. 使用scp命令要确保使用的用户具有可读取远程服务器相应文件的权限，否则scp命令是无法起作用的。


