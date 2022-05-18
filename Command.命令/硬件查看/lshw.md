
# lshw

lshw 这个命令是一个比较通用的工具，它可以详细的列出本机的硬件信息。但这个命令并非所有的发行版都有，比如 Fedora 就默认没有，需要自己安装。

lshw 可以从各个 /proc 文件中提取出硬件信息，比如：CPU、内存、usb 控制器、硬盘等。如果不带选项的话，列出的信息将很长，加上 -short 选项时，将只列出概要信息。

```sh
[alvin@VM_0_16_centos ~]$ sudo lshw -short
#篇幅关系，以下结果有删减
H/W path            Device      Class          Description
==========================================================
                                system         Bochs
/0                              bus            Motherboard
/0/0                            memory         96KiB BIOS
/0/401                          processor      Intel(R) Xeon(R) CPU E5-26xx v4
/0/1000                         memory         2GiB System Memory
/0/1000/0                       memory         2GiB DIMM RAM
/0/100                          bridge         440FX - 82441FX PMC [Natoma]
/0/100/1                        bridge         82371SB PIIX3 ISA [Natoma/Triton II]
/0/100/1.1/0.1.0    /dev/cdrom  disk           QEMU DVD-ROM
/0/100/1.2/1        usb1        bus            UHCI Host Controller
/0/100/1.3                      bridge         82371AB/EB/MB PIIX4 ACPI
/0/100/4/0/1        /dev/vda1   volume         49GiB EXT3 volume
/0/100/5                        generic        Virtio memory balloon
/0/100/5/0                      generic        Virtual I/O device
/0/1                            system         PnP device PNP0b00
/0/2                            input          PnP device PNP0303
```
