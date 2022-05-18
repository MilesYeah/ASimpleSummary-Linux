# sosreport

sosreport 命令用于收集系统配置及架构信息并输出诊断文档，格式为 sosreport。

当 Linux 系统出现故障需要联系技术支持人员时，大多数时候都要先使用这个命令来简单收集系统的运行状态和服务配置信息，以便让技术支持人员能够远程解决一些小问题，亦或让他们能提前了解某些复杂问题。

在下面的输出信息中，加粗的部分是收集好的资料压缩文件以及校验码，将其发送给技术支持人员即可：

```sh
[root@RHEL7CCIE ~]# sosreport

sosreport (version 3.0)

This command will collect diagnostic and configuration information from
this Red Hat Enterprise Linux system and installed applications.

An archive containing the collected information will be generated in
/var/tmp and may be provided to a Red Hat support representative.

Any information provided to Red Hat will be treated in accordance with
the published support policies at:

  https://access.redhat.com/support/

The generated archive may contain data considered sensitive and its
content should be reviewed by the originating organization before being
passed to any third party.

No changes will be made to system configuration.

Press ENTER to continue, or CTRL-C to quit.                             # Ctrl+C 可以推出

Please enter your first initial and last name [RHEL7CCIE]:              # 此处敲击回车来确认主机编号，回车继续，可以不填
Please enter the case number that you are generating this report for:   # 此处敲击回车来确认主机编号，回车继续，可以不填

 Running plugins. Please wait ...

  Running 69/69: yum...
Creating compressed archive...

Your sosreport has been generated and saved in:
  /var/tmp/sosreport-RHEL7CCIE-20200907151644.tar.xz

The checksum is: f740aa034b8ade9d344d6467e806ef61

Please send this file to your support representative.

[root@RHEL7CCIE ~]# ll /var/tmp/
total 5024
drwxr-xr-x. 4 abrt abrt    4096 Sep  7 15:18 abrt
-rw-------. 1 root root 5133132 Sep  7 15:18 sosreport-RHEL7CCIE-20200907151644.tar.xz
-rw-r--r--. 1 root root      33 Sep  7 15:18 sosreport-RHEL7CCIE-20200907151644.tar.xz.md5
drwx------. 3 root root      16 Sep  7 11:41 systemd-private-bp2PsY
drwx------. 3 root root      16 Sep  7 11:41 systemd-private-JRJgP4
drwx------. 3 root root      16 Sep  7 11:27 systemd-private-jSYSIW
drwx------. 3 root root      16 Sep  7 11:25 systemd-private-LjHRMt
drwx------. 3 root root      16 Sep  7 15:16 systemd-private-P1DG7H
drwx------. 3 root root      16 Sep  7 11:25 systemd-private-pAGrFn
[root@RHEL7CCIE ~]#
```

