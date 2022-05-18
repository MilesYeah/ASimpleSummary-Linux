


## ifconfig 查看网络配置信息

ifconfig命令用于获取网卡配置与网络状态等信息，格式为“`ifconfig [网络设备] [参数]`”。

其实主要查看的就是: 
* 网卡名称: `em1`
* inet参数后面的IPv4地址: `192.168.123.143`
* inet6参数后面的IPv6地址： `fe80::226:b9ff:fe75:6d67`
* 网卡物理地址（MAC）: `00:26:b9:75:6d:67`
* RX、TX的接收数据包，发送数据包的个数及累计流量，直到下次重启为止
  * RX 收到
  * TX 发出


```sh
# 列出所有网络设备的信息
[root@dell_tower ~]# ifconfig
em1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.123.143  netmask 255.255.255.0  broadcast 192.168.123.255
        inet6 fe80::226:b9ff:fe75:6d67  prefixlen 64  scopeid 0x20<link>
        ether 00:26:b9:75:6d:67  txqueuelen 1000  (Ethernet)
        RX packets 8587  bytes 721459 (704.5 KiB)
        RX errors 1  dropped 0  overruns 0  frame 8
        TX packets 2490  bytes 243688 (237.9 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device interrupt 16

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 0  (Local Loopback)
        RX packets 4  bytes 340 (340.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 4  bytes 340 (340.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

virbr0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        inet 192.168.122.1  netmask 255.255.255.0  broadcast 192.168.122.255
        ether 52:54:00:f8:fe:8c  txqueuelen 0  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```
lo 只是一个回环地址，一般只是用来测试系统网络没有通，网卡驱动有没有装好。

```sh
# 只列出em1的信息
[root@dell_tower ~]# ifconfig em1
em1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.123.143  netmask 255.255.255.0  broadcast 192.168.123.255
        inet6 fe80::226:b9ff:fe75:6d67  prefixlen 64  scopeid 0x20<link>
        ether 00:26:b9:75:6d:67  txqueuelen 1000  (Ethernet)
        RX packets 8601  bytes 722565 (705.6 KiB)
        RX errors 1  dropped 0  overruns 0  frame 8
        TX packets 2504  bytes 245574 (239.8 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device interrupt 16

# 结合grep查询IP
[root@dell_tower miles]# ifconfig em1 | grep "inet"
        inet 192.168.123.143  netmask 255.255.255.0  broadcast 192.168.123.255
        inet6 fe80::226:b9ff:fe75:6d67  prefixlen 64  scopeid 0x20<link>
[root@dell_tower miles]# ifconfig p1p3 | grep -w inet
        inet 10.86.123.93  netmask 255.255.252.0  broadcast 10.86.123.255

# 结合grep和head取出第一行
[root@dell_tower miles]# ifconfig em1 | grep "inet" | head -1
        inet 192.168.123.143  netmask 255.255.255.0  broadcast 192.168.123.255
```




启动关闭指定网卡
```sh
# ifconfig eth0 down
# ifconfig eth0 up
```


为网卡配置和删除IPv6地址
```sh
# ifconfig eth0 add 33ffe:3240:800:1005::2/ 64 //为网卡设置IPv6地址

# ifconfig eth0 del 33ffe:3240:800:1005::2/ 64 //为网卡删除IPv6地址
```

用ifconfig修改MAC地址
```sh
# ifconfig eth0 down //关闭网卡
# ifconfig eth0 hw ether 00:AA:BB:CC:DD:EE //修改MAC地址
# ifconfig eth0 up //启动网卡
# ifconfig eth1 hw ether 00:1D:1C:1D:1E //关闭网卡并修改MAC地址 
# ifconfig eth1 up //启动网卡
```

配置IP地址
```sh
# ifconfig eth0 192.168.1.56 
//给eth0网卡配置IP地址
# ifconfig eth0 192.168.1.56 netmask 255.255.255.0 
// 给eth0网卡配置IP地址,并加上子掩码
# ifconfig eth0 192.168.1.56 netmask 255.255.255.0 broadcast 192.168.1.255
// 给eth0网卡配置IP地址,加上子掩码,加上个广播地址
```

启用和关闭ARP协议
```sh
# ifconfig eth0 arp  //开启
# ifconfig eth0 -arp  //关闭
```

设置最大传输单元
```sh
# ifconfig eth0 mtu 1500 
//设置能通过的最大数据包大小为 1500 bytes
```
