
# Ubuntu允许root用户远程登录

danteit 2019-01-09 15:59:45 10175 收藏 6
分类专栏： 服务器运维
版权



## 进入Ubuntu系统

首先使用普通用户登录到Ubuntu系统，然后使用sudo命令切换到root用户下。

使用到的命令：
```sh
dante@dante:~$ sudo su -

[sudo] password for dante:                  #这里需要输入当前登录用户的密码。
```



## 编辑SSH服务配置文件

编辑SSH服务的配置文件sshd_config，修改SSH的端口和root用户权限。

使用到的命令：（按字母“i”进入编辑模式，按ESC退出编辑模式，“:wq”保存退出）。
```
root@dante:~# vim /etc/ssh/sshd_config
```



### 找到# port 22所在的那一行，复制该行内容并修改。

将“#port 22”修改为“port 22”（将前面的“#”去掉）。

该行内容为设置SSHd服务的端口号




### 找到#PermitRootLogin prohibit-password那一行，复制该行内容并修改。

将“#PermitRootLogin prohibit-password”修改为“PermitRootLogin yes”

改行内容为设置允许root用户远程登录。

然后保存该文件，然后重启服务。

使用到命令为：
```
root@dante:~# service sshd restart
```



## 修改root用户密码

修改root用户密码，建议将root用户密码设置尽量复杂。

使用到命令如下

root@dante:~# passwd root

Enter new UNIX password:                                 #输入root用户密码

Retype new UNIX password:                              #再次输入root用户密码

passwd: password updated successfully

如果看到“passwd: password updated successfully”，则证明密码修改成功。




## 登录验证

使用root用户登录验证


————————————————
版权声明：本文为CSDN博主「danteit」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/dantesite/java/article/details/86157787

