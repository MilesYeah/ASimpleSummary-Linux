# ipmitool edit FRU

Please use the below commands to fix it under Linux
1. ipmitool fru read 0 /MB_FRU_bk.tmp     (Backup the FRU, if it fails to update the 2U info , you can do a restore action)
2. ipmitool fru edit 0 field p 3 M20NTP2UR208
3. ipmitool fru to check the product Version is M20NTP2UR208

