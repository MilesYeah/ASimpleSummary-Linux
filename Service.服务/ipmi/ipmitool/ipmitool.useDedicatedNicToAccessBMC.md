1. Use on-board shared NIC of BMC, to logon BMC HTTPs server then selects  “Launch Control” from “Remote Control->KVM/Control Redirection” tool tip.
         ipmitool lan set 1 ipsrc dhcp
         ipmitool lan print 1
         ipmitool lan set 1 access on
         ipmitool user list 1
