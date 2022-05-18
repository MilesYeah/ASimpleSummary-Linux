# cut命令

cut命令用于按“列”提取文本字符，格式为 `cut [参数] 文本`。

在Linux系统中，如何准确地提取出最想要的数据，这也是我们应该重点学习的内容。
一般而言，按基于“行”的方式来提取数据是比较简单的，只需要设置好要搜索的关键词即可。
但是如果按列搜索，不仅要使用-f参数来设置需要看的列数，还需要使用-d参数来设置间隔符号。

passwd在保存用户数据信息时，用户信息的每一项值之间是采用冒号来间隔的，接下来我们使用下述命令尝试提取出passwd文件中的用户名信息，即提取以冒号（：）为间隔符号的第一列内容：
```sh
[root@RHEL7CCIE ~]# head -n 2 /etc/passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
[root@RHEL7CCIE ~]#
[root@RHEL7CCIE ~]# cut -d : -f 1 /etc/passwd
root
bin
daemon
adm
lp
sync
shutdown
halt
mail
operator
games
ftp
nobody
dbus
polkitd
unbound
colord
usbmuxd
avahi
avahi-autoipd
libstoragemgmt
saslauth
qemu
rpc
rpcuser
nfsnobody
rtkit
radvd
ntp
chrony
abrt
pulse
gdm
gnome-initial-setup
postfix
sshd
tcpdump
miles
[root@RHEL7CCIE ~]#
```


