




ipmitool启动报错”Could not open device at /dev/ipmi0 or /dev/ipmi/0 or /dev/ipmidev/0: No”
2013年12月08日 ⁄ 综合 ⁄ 共 580字 ⁄ 字号 小 中 大 ⁄ 评论关闭

  

当提示：
```
[root@localhost ~]# ipmitool sdr
Could not open device at /dev/ipmi0 or /dev/ipmi/0 or /dev/ipmidev/0: No
such file or directory
Get Device ID command failed
Unable to open SDR for reading
```
需要添加如下：
```
[root@localhost ~]# modprobe ipmi_watchdog
[root@localhost ~]# modprobe ipmi_poweroff
[root@localhost ~]# modprobe ipmi_devintf
[root@localhost ~]# modprobe ipmi_si
[root@localhost ~]# modprobe ipmi_msghandler
```

当添加ipmi_si时，提示：
```
FATAL:   Error   inserting   ipmi_si   (/lib/modules/2.6.9-5.ELsmp/kernel/drivers/char/ipmi/ipmi_si.ko):   No    such   device
```
这是因为机器上没有IPMI设备而出现的报错。

本文出自 “静待花开” 博客，请务必保留此出处http://motor.blog.51cto.com/729413/894616







## 直接烧录 FRU bin



