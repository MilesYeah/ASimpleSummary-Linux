
## 判断Linux是否从UEFI模式启动



### The easiest way 
is to check to see if /sys/firmware/efi exists. It does not appear if you booted using traditional BIOS.
```sh
#!/bin/bash
[ -d /sys/firmware/efi ] && echo UEFI || echo BIOS
```

It's very easy to tell if a system was booted in EFI (or not, in which case it must be BIOS):

## use `dmesg | grep "EFI v"`

* This will return a line like this, if the system was booted off of EFI:
`[ 0.000000] EFI v2.00 by American Megatrends`
* Or return nothing if it was not, in which case it was booted off of BIOS
Example of bash script usage based on grep's exit code:

```sh
dmesg | grep -q "EFI v"    # -q tell grep to output nothing
if [ $? -eq 0 ]      # check exit code; if 0 EFI, else BIOS
then
    echo "You are using EFI boot."
  else
    echo "You are using BIOS boot"
fi
```




### Python code to check if system is booted with UEFI or ROM BIOS:
```py
import os,sys
def main():
    if(os.path.exists("/sys/firmware/efi")):
        print"\n\n System is booted with uefi!"
    else:
        print"\n\n System is booted with rom bios"
main()
sys.exit(0)
```



### First method:

Ok, I booted up my UEFI box to check. First clue, near the top of dmesg. This shouldn't appear if you're booted via BIOS:
```
[    0.000000] efi: EFI v2.31 by American Megatrends
[    0.000000] efi:  ACPI=0xd8769000  ACPI 2.0=0xd8769000  SMBIOS=0xd96d4a98 
[    0.000000] efi: mem00: type=6, attr=0x800000000000000f, range=[0x0000000000000000-0x0000000000001000) (0MB)
⋮
```

### Second method:
```sh
$ sudo efibootmgr
BootCurrent: 0000
Timeout: 0 seconds
BootOrder: 0000
Boot0000* debian
```

If you are not, then the following should appear:
```sh
$ sudo efibootmgr        
EFI variables are not supported on this system.
```

Note that you'll have to have the efibootmgr package installed. You can also attempt to list the EFI variables:
```
$ efivar -l 
... over 100 lines of output ...
```

### Third method:

Check if you have a /boot/efi:
```sh
$ df -h --local | grep /boot
/dev/sda2       229M   31M  187M  14% /boot
/dev/sda1       120M  250K  119M   1% /boot/efi
```
Inside that partition should be the files that UEFI executes to boot.

If using any of these methods the relevant entries doesn't appear, is very likely you are not using UEFI.





