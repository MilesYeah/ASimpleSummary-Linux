# su与sudo

su 是一条命令。
sudo 是一项服务。

su命令与用户名之间有一个减号（-），这意味着完全切换到新的用户，即把环境变量信息也变更为新用户的相应信息，而不是保留原始的信息。
强烈建议在切换用户身份时添加这个减号（-）。

当从root管理员切换到普通用户时是不需要密码验证的，而从普通用户切换成root管理员就需要进行密码验证了；
尽管像上面这样使用su命令后，普通用户可以完全切换到root管理员身份来完成相应工作，但这将暴露root管理员的密码，从而增大了系统密码被黑客获取的几率；这并不是最安全的方案。

sudo命令具有如下功能：

* 限制用户执行指定的命令：
* 记录用户执行的每一条命令；
* 配置文件（/etc/sudoers）提供集中的用户管理、权限与主机等参数；
* 验证密码的后5分钟内（默认值）无须再让用户再次验证密码。

使用sudo命令把特定命令的执行权限赋予给指定用户，这样既可保证普通用户能够完成特定的工作，也可以避免泄露root管理员密码。
我们要做的就是合理配置sudo服务，以便兼顾系统的安全性和用户的便捷性。
sudo服务的配置原则也很简单—在保证普通用户完成相应工作的前提下，尽可能少地赋予额外的权限。

如果担心直接修改配置文件会出现问题，则可以使用sudo命令提供的visudo命令来配置用户权限。
这条命令在配置用户权限时将禁止多个用户同时修改sudoers配置文件，还可以对配置文件内的参数进行语法检查，并在发现参数错误时进行报错。

用visudo命令配置sudo命令的配置文件时，其操作方法与Vim编辑器中用到的方法一致，因此在编写完成后记得在末行模式下保存并退出。
在sudo命令的配置文件中，按照下面的格式将第99行（大约）填写上指定的信息：`user hosts=(identity) cmd`






## 实例 为普通用户添加 sudo 权限

```sh
[root@RHEL7CCIE ~]# su zhangsan
[zhangsan@RHEL7CCIE root]$ reboot
User root is logged in on sshd.
User root is logged in on sshd.
Please retry operation after closing inhibitors and logging out other users.
Alternatively, ignore inhibitors and users with 'systemctl reboot -i'.
[zhangsan@RHEL7CCIE root]$ sudo reboot
[sudo] password for zhangsan:
zhangsan is not in the sudoers file.  This incident will be reported.
[zhangsan@RHEL7CCIE root]$
```

添加zhangsan 用户，所有host 所有身份都可以执行所有命令
```sh
[root@RHEL7CCIE ~]# visudo
[root@RHEL7CCIE ~]# sed -n '95,110p' /etc/sudoers
## The COMMANDS section may have other options added to it.
##
## Allow root to run any commands anywhere
root    ALL=(ALL)       ALL

zhangsan ALL=(ALL) /usr/sbin/reboot

## Allows members of the 'sys' group to run networking, software,
## service management apps and more.
# %sys ALL = NETWORKING, SOFTWARE, SERVICES, STORAGE, DELEGATING, PROCESSES, LOCATE, DRIVERS

## Allows people in group wheel to run all commands
%wheel  ALL=(ALL)       ALL

## Same thing without a password
# %wheel        ALL=(ALL)       NOPASSWD: ALL
[root@RHEL7CCIE ~]#
```

```sh
[root@RHEL7CCIE ~]# su zhangsan
[zhangsan@RHEL7CCIE root]$ reboot
User root is logged in on sshd.
User root is logged in on sshd.
Please retry operation after closing inhibitors and logging out other users.
Alternatively, ignore inhibitors and users with 'systemctl reboot -i'.
[zhangsan@RHEL7CCIE root]$ sudo reboot
[sudo] password for zhangsan:

```
