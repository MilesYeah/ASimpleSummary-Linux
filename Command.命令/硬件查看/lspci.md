
# lspci

lspci 列出所有 PCI 总线，以及与 PCI 总线相连的所有设备的详细信息，比如 VGA 适配器、显卡、网络适配器、usb 端口、SATA 控制器等。

```sh
[alvin@VM_0_16_centos ~]$ lspci
00:00.0 Host bridge: Intel Corporation 440FX - 82441FX PMC [Natoma] (rev 02)
00:01.0 ISA bridge: Intel Corporation 82371SB PIIX3 ISA [Natoma/Triton II]
00:01.1 IDE interface: Intel Corporation 82371SB PIIX3 IDE [Natoma/Triton II]
00:01.2 USB controller: Intel Corporation 82371SB PIIX3 USB [Natoma/Triton II] (rev 01)
00:01.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 03)
00:02.0 VGA compatible controller: Cirrus Logic GD 5446
00:03.0 Ethernet controller: Red Hat, Inc Virtio network device
00:04.0 SCSI storage controller: Red Hat, Inc Virtio block device
00:05.0 Unclassified device [00ff]: Red Hat, Inc Virtio memory balloon
```




### lspci：显示所有的pci设备信息。包括设备的BDF，设备类型，厂商信息等。
### lspci -t [BDF]：显示指定BDF号的设备信息。
### lspci -m/-mm：以一种机器可读的格式来显示pci设备信息。下面的实例可以看出其具体的区别。
```conf
# lspci -s ff:13.1
ff:13.1 System peripheral: Intel Corporation Broadwell Memory Controller 0 - Target Address/Thermal/RAS (rev 03)
# lspci -mm -s ff:13.1
ff:13.1 "System peripheral" "Intel Corporation" "Broadwell Memory Controller 0 - Target Address/Thermal/RAS" -r03 "Intel Corporation" "Broadwell Memory Controller 0 - Target Address/Thermal/RAS"
```



### lspci -t：以树的形式显示pci设备信息。
### lspci -v/-vv/-vvv：显示详细的pci设备信息，v越多，越详细，当然，上限3个。
```sh
# lspci -s ff:1f.2
ff:1f.2 System peripheral: Intel Corporation Broadwell Power Control Unit (rev 03)
# lspci -v -s ff:1f.2
ff:1f.2 System peripheral: Intel Corporation Broadwell Power Control Unit (rev 03)
    Flags: fast devsel
# lspci -vv -s ff:1f.2
ff:1f.2 System peripheral: Intel Corporation Broadwell Power Control Unit (rev 03)
    Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
    Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
# lspci -vvv -s ff:1f.2
ff:1f.2 System peripheral: Intel Corporation Broadwell Power Control Unit (rev 03)
    Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
    Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
```



### lspci -x/-xxx/-xxxx：-x以16进制信息显示pci配置空间；-xxx显示部分读配置空间会crash的设备；-xxxx显示PCI-x2.0或者PCI-e总线扩展的配置空间。
### lspci -b：以总线的角度来显示所有的IRQ和地址。根据我的观察，大部分信息和不带参数时显示一致，除了SR-IOV设备分配出的Virtual Function设备。如下示例：物理网卡PF（physical function ）显示一直 ，但VF(virtual function )显示却不同。
```sh
# lspci -b -s 0a:00.1; lspci -b -s 0a:10.0
0a:00.1 Ethernet controller: Intel Corporation Ethernet Controller 10-Gigabit X540-AT2 (rev 01)
0a:10.0 Ethernet controller: Illegal Vendor ID Device ffff (rev 01)
# lspci -s 0a:00.1; lspci -s 0a:10.0
0a:00.1 Ethernet controller: Intel Corporation Ethernet Controller 10-Gigabit X540-AT2 (rev 01)
0a:10.0 Ethernet controller: Intel Corporation X540 Ethernet Controller Virtual Function (rev 01)
```



### lspci -D：显示PCI domain号，默认的不加参数命令并不显示该值。如下示例：
```sh
# lspci -s 0a:00.0
0a:00.0 Ethernet controller: Intel Corporation Ethernet Controller 10-Gigabit X540-AT2 (rev 01)
# lspci -D -s 0a:00.0
0000:0a:00.0 Ethernet controller: Intel Corporation Ethernet Controller 10-Gigabit X540-AT2 (rev 01)
```



### lspci -n/-nn：显示设备的vendor厂商号和device设备号；显示厂商等信息和名称。
```sh
# lspci -nn | grep ff:1f.2
ff:1f.2 System peripheral [0880]: Intel Corporation Broadwell Power Control Unit [8086:6f8a] (rev 03)
# lspci -n | grep ff:1f.2
ff:1f.2 0880: 8086:6f8a (rev 03)
```



### lspci -D：显示设备的厂商号、设备号、Class号。
```sh
# lspci -Q -s 0c:00.1
0c:00.1 Class 0200: Device 8086:1528 (rev 01)
```





## ref
* [styshoo」的原创文章](https://blog.csdn.net/styshoo/article/details/51281437)
* []()
* []()
* []()
* []()
* []()
* []()
* []()
