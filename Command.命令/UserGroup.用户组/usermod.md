# usermod命令

usermod命令用于修改用户的属性，格式为“usermod [选项] 用户名”。

前文曾反复强调，Linux系统中的一切都是文件，因此在系统中创建用户也就是修改配置文件的过程。用户的信息保存在/etc/passwd文件中，可以直接用文本编辑器来修改其中的用户参数项目，也可以用usermod命令修改已经创建的用户信息，诸如用户的UID、基本/扩展用户组、默认终端等。

usermod命令中的参数及作用

| 参数  | 作用                                                               |
| ----- | ------------------------------------------------------------------ |
| -c    | 填写用户账户的备注信息                                             |
| -d -m | 参数-m与参数-d连用，可重新指定用户的家目录并自动把旧的数据转移过去 |
| -e    | 账户的到期时间，格式为YYYY-MM-DD                                   |
| -g    | 变更所属用户组                                                     |
| -G    | 变更扩展用户组，将用户添加到多个组                                 |
| -L    | 锁定用户禁止其登录系统                                             |
| -U    | 解锁用户，允许其登录系统                                           |
| -s    | 变更默认终端                                                       |
| -u    | 修改用户的UID                                                      |
| -l    |                                                                    |


```sh
[root@localhost ~]# usermod -h
Usage: usermod [options] LOGIN

Options:
  -c, --comment COMMENT         new value of the GECOS field
  -d, --home HOME_DIR           new home directory for the user account
  -e, --expiredate EXPIRE_DATE  set account expiration date to EXPIRE_DATE
  -f, --inactive INACTIVE       set password inactive after expiration
                                to INACTIVE
  -g, --gid GROUP               force use GROUP as new primary group
  -G, --groups GROUPS           new list of supplementary GROUPS
  -a, --append                  append the user to the supplemental GROUPS
                                mentioned by the -G option without removing
                                the user from other groups
  -h, --help                    display this help message and exit
  -l, --login NEW_LOGIN         new value of the login name
  -L, --lock                    lock the user account
  -m, --move-home               move contents of the home directory to the
                                new location (use only with -d)
  -o, --non-unique              allow using duplicate (non-unique) UID
  -p, --password PASSWORD       use encrypted password for the new password
  -R, --root CHROOT_DIR         directory to chroot into
  -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files
  -s, --shell SHELL             new login shell for the user account
  -u, --uid UID                 new UID for the user account
  -U, --unlock                  unlock the user account
  -v, --add-subuids FIRST-LAST  add range of subordinate uids
  -V, --del-subuids FIRST-LAST  remove range of subordinate uids
  -w, --add-subgids FIRST-LAST  add range of subordinate gids
  -W, --del-subgids FIRST-LAST  remove range of subordinate gids
  -Z, --selinux-user SEUSER     new SELinux user mapping for the user account

[root@localhost ~]#
```


```sh
[root@RHEL7CCIE ~]# groupadd linuxcool
[root@RHEL7CCIE ~]# usermo
usermod    usermount
[root@RHEL7CCIE ~]# usermod -G linuxcool xiaoqi
[root@RHEL7CCIE ~]# id xiaoqi
uid=1001(xiaoqi) gid=1001(xiaoqi) groups=1001(xiaoqi),6667(linuxcool)
[root@RHEL7CCIE ~]#
```


```sh
[root@RHEL7CCIE ~]# usermod -u 5555 xiaoqi
[root@RHEL7CCIE ~]# id xiaoqi
uid=5555(xiaoqi) gid=1001(xiaoqi) groups=1001(xiaoqi),6667(linuxcool)
[root@RHEL7CCIE ~]#
```

