



```sh
ifconfig eth0 192.168.0.200 netmask 255.255.255.0
#临时设置etho网卡的IP地址与子网掩码
```


1、网卡信息文件
```sh
[root@localhost～]#vi/etc/sysconfig/network-scripts/ifcfg-etho 
DEVICE=eth0             网卡设备名
BOOTPROTO=none          是否自动获取IP（none、static、dhcp）
HWADDR=00：0c：29：17：c4：09       MAC地址
NM_CONTROLLED=yes               是否可以由Network Manager图形管理工具托管
ONBOOT=yes                      是否随网络服务启动，eth0生效
TYPE=Ethernet                   类型为以太网
UUID="44b76c8a-b59f-44d5-83fa-7f98fda86b3d"         唯一识别码
IPADDR=192.168.0.252            IP地址
NETMASK=255.255.255.0           子网掩码
GATEWAY=192.168.0.1             网关
DNS1=202.106.0.20               DNS 
IPV6INIT=noIPv6                 没有启用
USERCTL=no                      不允许非root用户控制此网卡
```



2、主机名文件
```sh
[root@localhost~]#vi/etc/sysconfig/network
NETWORKING=yes
HOSTNAME=localhost.localdomain
[root@localhost～]#hostname[主机名]
#查看与临时设置主机名命令
```

3、DNS配置文件
```sh
[root@localhost~]#vi/etc/resolv.conf
nameserver 202.106.0.20
search localhost
```


```sh
[root@localhost ~]# vi /etc/sysconfig/network-scripts/ifcfg-eth0
[rootelocalhost ~]# vi /etc/sysconfig/network
[root@localhost ~]# hostname imooc
[root@localhost ~]# hostname 
imooc
[root@localhost ~]# vi/etc/resolv.conf
[rootelocalhost ~]# setup
[root@localhost ~]#
```