

[root@localhost ~]# nvme -h
ERROR: Invalid sub-command 'h'
nvme-1.12
usage: nvme <command> [<device>] [<args>]

The '<device>' may be either an NVMe character device (ex: /dev/nvme0) or an
nvme block device (ex: /dev/nvme0n1).

The following are all implemented sub-commands:
  list                  List all NVMe devices and namespaces on machine
  list-subsys           List nvme subsystems
  id-ctrl               Send NVMe Identify Controller
  id-ns                 Send NVMe Identify Namespace, display structure
  id-ns-granularity     Send NVMe Identify Namespace Granularity List, display structure
  list-ns               Send NVMe Identify List, display structure
  list-ctrl             Send NVMe Identify Controller List, display structure
  list-secondary        List Secondary Controllers associated with a Primary Controller
  ns-descs              Send NVMe Namespace Descriptor List, display structure
  id-nvmset             Send NVMe Identify NVM Set List, display structure
  id-uuid               Send NVMe Identify UUID List, display structure
  create-ns             Creates a namespace with the provided parameters
  delete-ns             Deletes a namespace from the controller
  attach-ns             Attaches a namespace to requested controller(s)
  detach-ns             Detaches a namespace from requested controller(s)
  get-ns-id             Retrieve the namespace ID of opened block device
  get-log               Generic NVMe get log, returns log in raw format
  telemetry-log         Retrieve FW Telemetry log write to file
  fw-log                Retrieve FW Log, show it
  changed-ns-list-log   Retrieve Changed Namespace List, show it
  smart-log             Retrieve SMART Log, show it
  ana-log               Retrieve ANA Log, show it
  error-log             Retrieve Error Log, show it
  effects-log           Retrieve Command Effects Log, show it
  endurance-log         Retrieve Endurance Group Log, show it
  get-feature           Get feature and show the resulting value
  device-self-test      Perform the necessary tests to observe the performance
  self-test-log         Retrieve the SELF-TEST Log, show it
  set-feature           Set a feature and show the resulting value
  set-property          Set a property and show the resulting value
  get-property          Get a property and show the resulting value
  format                Format namespace with new block format
  fw-commit             Verify and commit firmware to a specific slot (fw-activate in old version < 1.2)
  fw-download           Download new firmware
  admin-passthru        Submit an arbitrary admin command, return results
  io-passthru           Submit an arbitrary IO command, return results
  security-send         Submit a Security Send command, return results
  security-recv         Submit a Security Receive command, return results
  get-lba-status        Submit a Get LBA Status command, return results
  resv-acquire          Submit a Reservation Acquire, return results
  resv-register         Submit a Reservation Register, return results
  resv-release          Submit a Reservation Release, return results
  resv-report           Submit a Reservation Report, return results
  dsm                   Submit a Data Set Management command, return results
  flush                 Submit a Flush command, return results
  compare               Submit a Compare command, return results
  read                  Submit a read command, return results
  write                 Submit a write command, return results
  write-zeroes          Submit a write zeroes command, return results
  write-uncor           Submit a write uncorrectable command, return results
  verify                Submit a verify command, return results
  sanitize              Submit a sanitize command
  sanitize-log          Retrieve sanitize log, show it
  reset                 Resets the controller
  subsystem-reset       Resets the subsystem
  ns-rescan             Rescans the NVME namespaces
  show-regs             Shows the controller registers or properties. Requires character device
  discover              Discover NVMeoF subsystems
  connect-all           Discover and Connect to NVMeoF subsystems
  connect               Connect to NVMeoF subsystem
  disconnect            Disconnect from NVMeoF subsystem
  disconnect-all        Disconnect from all connected NVMeoF subsystems
  gen-hostnqn           Generate NVMeoF host NQN
  show-hostnqn          Show NVMeoF host NQN
  dir-receive           Submit a Directive Receive command, return results
  dir-send              Submit a Directive Send command, return results
  virt-mgmt             Manage Flexible Resources between Primary and Secondary Controller 
  version               Shows the program version
  help                  Display this help

See 'nvme help <command>' for more information on a specific command

The following are all installed plugin extensions:
  intel           Intel vendor specific extensions
  lnvm            LightNVM specific extensions
  memblaze        Memblaze vendor specific extensions
  wdc             Western Digital vendor specific extensions
  huawei          Huawei vendor specific extensions
  netapp          NetApp vendor specific extensions
  toshiba         Toshiba NVME plugin
  micron          Micron vendor specific extensions
  seagate         Seagate vendor specific extensions
  virtium         Virtium vendor specific extensions
  shannon         Shannon vendor specific extensions
  dera            Dera vendor specific extensions
  sfx             ScaleFlux vendor specific extensions
  transcend       Transcend vendor specific extensions

See 'nvme <plugin> help' for more information on a plugin
[root@localhost ~]# 




