

## 通配符(wildcard)

通配符是由shell处理的，不是由所涉及到命令语句处理的，它一般只会出现在 命令的“参数”里。  
当shell在“参数”中遇到了通配符时，shell会将其当作路径或文件名去在磁盘上搜寻可能的匹配：  
若符合要求的匹配存在，则进行代换(路径扩展)；否则就将该通配符作为一个普通字符传递给“命令”，然后再由命令进行处理。  
总之，通配符 实际上就是一种shell实现的路径扩展功能。  
在 通配符被处理后, shell会先完成该命令的重组，然后再继续处理重组后的命令，直至执行该命令。

shell常见通配符：
| 字符                    | 含义                                        | 实例                                                                                   |
| ----------------------- | ------------------------------------------- | -------------------------------------------------------------------------------------- |
| `*`                     | 匹配 0 或多个字符                           | `a*b`: a与b之间可以有任意长度的任意字符, 也可以一个也没有, 如aabcb, axyzb, a012b, ab。 |
| `?`                     | 匹配任意一个字符                            | `a?b`: a与b之间必须也只能有一个字符, 可以是任意字符, 如aab, abb, acb, a0b。            |
| `[list]`                | 匹配 list 中的任意单一字符                  | `a[xyz]b`: a与b之间必须也只能有一个字符, 但只能是 x 或 y 或 z, 如: axb, ayb, azb。     |
| `[!list]`               | 匹配 除list 中的任意单一字符                | `a[!0-9]b`: a与b之间必须也只能有一个字符, 但不能是阿拉伯数字, 如axb, aab, a-b。        |
| `[^list]`               | 匹配 除list 中的任意单一字符                | `a[!0-9]b`: a与b之间必须也只能有一个字符, 但不能是阿拉伯数字, 如axb, aab, a-b。        |
| `[c1-c2]`               | 匹配 c1-c2 中的任意单一字符 如：[0-9] [a-z] | `a[0-9]b`: 0与9之间必须也只能有一个字符 如a0b, a1b... a9b。                            |
| `{string1,string2,...}` | 匹配 sring1 或 string2 (或更多)其一字符串   | `a{abc,xyz,123}b`: a与b之间只能是abc或xyz或123这三个字符串之一。                       |

需要说明的是：通配符看起来有点象正则表达式语句，但是它与正则表达式不同的，不能相互混淆。  
把通配符理解为shell 特殊代号字符就可。而且涉及的只有，*,? [] ,{} 这几种。

```sh

[root@dell_tower ~]# ll -d /etc/cron*
drwxr-xr-x. 2 root root  85 Jul 12  2017 /etc/cron.d
drwxr-xr-x. 2 root root  92 Jul 12  2017 /etc/cron.daily
-rw-------. 1 root root   0 Jul 27  2015 /etc/cron.deny
drwxr-xr-x. 2 root root  44 Jul 12  2017 /etc/cron.hourly
drwxr-xr-x. 2 root root   6 Jun 10  2014 /etc/cron.monthly
-rw-r--r--  1 root root 510 Oct 11  2018 /etc/crontab
drwxr-xr-x. 2 root root   6 Jun 10  2014 /etc/cron.weekly
```
```sh
[root@dell_tower ~]# ll -d /etc/???
drwxr-xr-x. 6 root root 4096 Nov  9  2017 /etc/gdm
drwxr-xr-x. 3 root root   19 Jan 30  2019 /etc/gss
drwxr-xr-x. 4 root root   31 Jul 12  2017 /etc/ipa
drwxr-xr-x. 2 root root    6 Nov 21  2015 /etc/jvm
drwxr-xr-x. 3 root root   41 Jul 12  2017 /etc/lsm
drwxr-xr-x. 6 root root   94 Jul 12  2017 /etc/lvm
drwxr-xr-x. 3 root root   49 Jul 12  2017 /etc/ntp
drwxr-xr-x. 2 root root    6 Aug 12  2015 /etc/opt
drwxr-xr-x. 6 root root   57 Jul 12  2017 /etc/pcp
drwxr-xr-x. 9 root root   91 Jul 12  2017 /etc/pki
drwxr-xr-x. 3 root root 4096 Jul 12  2017 /etc/ppp
-rw-r--r--. 1 root root 1634 Dec 25  2012 /etc/rpc
drwxr-xr-x. 2 root root 4096 Mar  8  2019 /etc/rpm
drwxr-xr-x. 3 root root   32 Jul 12  2017 /etc/scl
drwxr-xr-x. 2 root root 4096 Aug 21  2017 /etc/ssh
drwxr-xr-x. 2 root root   18 Jul 12  2017 /etc/ssl
drwxr-xr-x. 6 root root   97 Jul 12  2017 /etc/X11
drwxr-xr-x. 5 root root   94 Jul 12  2017 /etc/xdg
drwxr-xr-x. 2 root root   20 Jul 12  2017 /etc/xml
drwxr-xr-x. 6 root root 4096 Jul 12  2017 /etc/yum
[root@dell_tower ~]#
```
```sh
[root@dell_tower ~]# ll -d /etc/*[0-2]*
drwxr-xr-x. 2 root root   31 Jul 12  2017 /etc/at-spi2
drwxr-xr-x. 4 root root   74 Jul 12  2017 /etc/dbus-1
-rw-r--r--. 1 root root 5725 Sep 12  2015 /etc/DIR_COLORS.256color
-rw-r--r--  1 root root  112 Oct 30  2018 /etc/e2fsck.conf
lrwxrwxrwx. 1 root root   22 Jul 12  2017 /etc/grub2.cfg -> ../boot/grub2/grub.cfg
drwxr-xr-x. 2 root root 4096 Jul 12  2017 /etc/iproute2
-rw-r--r--  1 root root  936 Oct 31  2018 /etc/mke2fs.conf
-rw-r--r--. 1 root root 1362 Jun 10  2014 /etc/pbm2ppa.conf
drwxr-xr-x. 3 root root   20 Jul 12  2017 /etc/pkcs11
-rw-r--r--. 1 root root 6300 Jun 10  2014 /etc/pnm2ppa.conf
drwxr-xr-x. 5 root root   69 Jul 12  2017 /etc/polkit-1
lrwxrwxrwx. 1 root root   10 Jul 12  2017 /etc/rc0.d -> rc.d/rc0.d
lrwxrwxrwx. 1 root root   10 Jul 12  2017 /etc/rc1.d -> rc.d/rc1.d
lrwxrwxrwx. 1 root root   10 Jul 12  2017 /etc/rc2.d -> rc.d/rc2.d
drwxr-xr-x. 2 root root   78 Jul 12  2017 /etc/sasl2
drwxr-xr-x. 2 root root    6 Nov 20  2015 /etc/udisks2
drwxr-xr-x. 6 root root   97 Jul 12  2017 /etc/X11
[root@dell_tower ~]#
```
```sh
[root@dell_tower ~]# ll -d /etc/[!b-z]*
drwxr-xr-x. 3 root root    97 Jul 12  2017 /etc/abrt
-rw-r--r--. 1 root root    46 Nov  2  2018 /etc/adjtime
-rw-r--r--. 1 root root  1518 Jun  7  2013 /etc/aliases
-rw-r--r--. 1 root root 12288 Jul 12  2017 /etc/aliases.db
drwxr-xr-x. 2 root root    49 Jul 12  2017 /etc/alsa
drwxr-xr-x. 2 root root  4096 Aug  4  2018 /etc/alternatives
-rw-------. 1 root root   541 Jul 27  2015 /etc/anacrontab
-rw-r--r--. 1 root root    55 Mar  6  2015 /etc/asound.conf
-rw-r--r--. 1 root root     1 Nov 20  2015 /etc/at.deny
drwxr-xr-x. 2 root root    31 Jul 12  2017 /etc/at-spi2
drwxr-x---. 3 root root    41 Jul 12  2017 /etc/audisp
drwxr-x---. 3 root root    79 Jul 12  2017 /etc/audit
-rw-r--r--. 1 root root 12706 Nov 20  2015 /etc/autofs.conf
-rw-------. 1 root root   232 Nov 20  2015 /etc/autofs_ldap_auth.conf
-rw-r--r--. 1 root root   795 Nov 20  2015 /etc/auto.master
drwxr-xr-x. 2 root root     6 Nov 20  2015 /etc/auto.master.d
-rw-r--r--. 1 root root   524 Nov 20  2015 /etc/auto.misc
-rwxr-xr-x. 1 root root  1260 Nov 20  2015 /etc/auto.net
-rwxr-xr-x. 1 root root   687 Nov 20  2015 /etc/auto.smb
drwxr-xr-x. 4 root root    94 Jul 12  2017 /etc/avahi

[root@dell_tower ~]# ll -d /etc/[^b-z]*
drwxr-xr-x. 3 root root    97 Jul 12  2017 /etc/abrt
-rw-r--r--. 1 root root    46 Nov  2  2018 /etc/adjtime
-rw-r--r--. 1 root root  1518 Jun  7  2013 /etc/aliases
-rw-r--r--. 1 root root 12288 Jul 12  2017 /etc/aliases.db
drwxr-xr-x. 2 root root    49 Jul 12  2017 /etc/alsa
drwxr-xr-x. 2 root root  4096 Aug  4  2018 /etc/alternatives
-rw-------. 1 root root   541 Jul 27  2015 /etc/anacrontab
-rw-r--r--. 1 root root    55 Mar  6  2015 /etc/asound.conf
-rw-r--r--. 1 root root     1 Nov 20  2015 /etc/at.deny
drwxr-xr-x. 2 root root    31 Jul 12  2017 /etc/at-spi2
drwxr-x---. 3 root root    41 Jul 12  2017 /etc/audisp
drwxr-x---. 3 root root    79 Jul 12  2017 /etc/audit
-rw-r--r--. 1 root root 12706 Nov 20  2015 /etc/autofs.conf
-rw-------. 1 root root   232 Nov 20  2015 /etc/autofs_ldap_auth.conf
-rw-r--r--. 1 root root   795 Nov 20  2015 /etc/auto.master
drwxr-xr-x. 2 root root     6 Nov 20  2015 /etc/auto.master.d
-rw-r--r--. 1 root root   524 Nov 20  2015 /etc/auto.misc
-rwxr-xr-x. 1 root root  1260 Nov 20  2015 /etc/auto.net
-rwxr-xr-x. 1 root root   687 Nov 20  2015 /etc/auto.smb
drwxr-xr-x. 4 root root    94 Jul 12  2017 /etc/avahi
[root@dell_tower ~]#
```
```sh
[root@dell_tower ~]# mkdir /tmp/etcAfiles
[root@dell_tower ~]# cp -a /etc/[^b-z]* /tmp/etcAfiles/
[root@dell_tower ~]# ll /tmp/etcAfiles/
total 72
drwxr-xr-x. 3 root root    97 Jul 12  2017 abrt
-rw-r--r--. 1 root root    46 Nov  2  2018 adjtime
-rw-r--r--. 1 root root  1518 Jun  7  2013 aliases
-rw-r--r--. 1 root root 12288 Jul 12  2017 aliases.db
drwxr-xr-x. 2 root root    49 Jul 12  2017 alsa
drwxr-xr-x. 2 root root  4096 Aug  4  2018 alternatives
-rw-------. 1 root root   541 Jul 27  2015 anacrontab
-rw-r--r--. 1 root root    55 Mar  6  2015 asound.conf
-rw-r--r--. 1 root root     1 Nov 20  2015 at.deny
drwxr-xr-x. 2 root root    31 Jul 12  2017 at-spi2
drwxr-x---. 3 root root    41 Jul 12  2017 audisp
drwxr-x---. 3 root root    79 Jul 12  2017 audit
-rw-r--r--. 1 root root 12706 Nov 20  2015 autofs.conf
-rw-------. 1 root root   232 Nov 20  2015 autofs_ldap_auth.conf
-rw-r--r--. 1 root root   795 Nov 20  2015 auto.master
drwxr-xr-x. 2 root root     6 Nov 20  2015 auto.master.d
-rw-r--r--. 1 root root   524 Nov 20  2015 auto.misc
-rwxr-xr-x. 1 root root  1260 Nov 20  2015 auto.net
-rwxr-xr-x. 1 root root   687 Nov 20  2015 auto.smb
drwxr-xr-x. 4 root root    94 Jul 12  2017 avahi
[root@dell_tower ~]#

```

