# dmidecode

```sh
root@miles-vm:~# dmidecode  -h
Usage: dmidecode [OPTIONS]
Options are:
 -d, --dev-mem FILE     Read memory from device FILE (default: /dev/mem)
 -h, --help             Display this help text and exit
 -q, --quiet            Less verbose output
 -s, --string KEYWORD   Only display the value of the given DMI string
 -t, --type TYPE        Only display the entries of given type
 -H, --handle HANDLE    Only display the entry of given handle
 -u, --dump             Do not decode the entries
     --dump-bin FILE    Dump the DMI data to a binary file
     --from-dump FILE   Read the DMI data from a binary file
     --no-sysfs         Do not attempt to read DMI data from sysfs files
     --oem-string N     Only display the value of the given OEM string
 -V, --version          Display the version and exit
root@miles-vm:~#
```
```sh
root@miles-vm:~# dmidecode  -s
dmidecode: option requires an argument -- 's'
String keyword expected
Valid string keywords are:
  bios-vendor
  bios-version
  bios-release-date
  system-manufacturer
  system-product-name
  system-version
  system-serial-number
  system-uuid
  system-family
  baseboard-manufacturer
  baseboard-product-name
  baseboard-version
  baseboard-serial-number
  baseboard-asset-tag
  chassis-manufacturer
  chassis-type
  chassis-version
  chassis-serial-number
  chassis-asset-tag
  processor-family
  processor-manufacturer
  processor-version
  processor-frequency
root@miles-vm:~#
```
```sh
root@miles-vm:~# dmidecode -s system-manufacturer
innotek GmbH
root@miles-vm:~# dmidecode -s system-serial-number
0
root@miles-vm:~#
```
