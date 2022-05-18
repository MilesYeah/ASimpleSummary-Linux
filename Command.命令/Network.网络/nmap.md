# nmap Nmap——networkmapper，网络探测工具和安全/端口扫描器

nmap[扫描类型…] [选项] [扫描目标说明]

```sh
root@miles-vm:~# nmap
Nmap 7.80 ( https://nmap.org )
Usage: nmap [Scan Type(s)] [Options] {target specification}
TARGET SPECIFICATION:
  Can pass hostnames, IP addresses, networks, etc.
  Ex: scanme.nmap.org, microsoft.com/24, 192.168.0.1; 10.0.0-255.1-254
  -iL <inputfilename>: Input from list of hosts/networks
  -iR <num hosts>: Choose random targets
  --exclude <host1[,host2][,host3],...>: Exclude hosts/networks
  --excludefile <exclude_file>: Exclude list from file
HOST DISCOVERY:
  -sL: List Scan - simply list targets to scan
  -sn: Ping Scan - disable port scan
  -Pn: Treat all hosts as online -- skip host discovery
  -PS/PA/PU/PY[portlist]: TCP SYN/ACK, UDP or SCTP discovery to given ports
  -PE/PP/PM: ICMP echo, timestamp, and netmask request discovery probes
  -PO[protocol list]: IP Protocol Ping
  -n/-R: Never do DNS resolution/Always resolve [default: sometimes]
  --dns-servers <serv1[,serv2],...>: Specify custom DNS servers
  --system-dns: Use OS's DNS resolver
  --traceroute: Trace hop path to each host
SCAN TECHNIQUES:
  -sS/sT/sA/sW/sM: TCP SYN/Connect()/ACK/Window/Maimon scans
  -sU: UDP Scan
  -sN/sF/sX: TCP Null, FIN, and Xmas scans
  --scanflags <flags>: Customize TCP scan flags
  -sI <zombie host[:probeport]>: Idle scan
  -sY/sZ: SCTP INIT/COOKIE-ECHO scans
  -sO: IP protocol scan
  -b <FTP relay host>: FTP bounce scan
PORT SPECIFICATION AND SCAN ORDER:
  -p <port ranges>: Only scan specified ports
    Ex: -p22; -p1-65535; -p U:53,111,137,T:21-25,80,139,8080,S:9
  --exclude-ports <port ranges>: Exclude the specified ports from scanning
  -F: Fast mode - Scan fewer ports than the default scan
  -r: Scan ports consecutively - don't randomize
  --top-ports <number>: Scan <number> most common ports
  --port-ratio <ratio>: Scan ports more common than <ratio>
SERVICE/VERSION DETECTION:
  -sV: Probe open ports to determine service/version info
  --version-intensity <level>: Set from 0 (light) to 9 (try all probes)
  --version-light: Limit to most likely probes (intensity 2)
  --version-all: Try every single probe (intensity 9)
  --version-trace: Show detailed version scan activity (for debugging)
SCRIPT SCAN:
  -sC: equivalent to --script=default
  --script=<Lua scripts>: <Lua scripts> is a comma separated list of
           directories, script-files or script-categories
  --script-args=<n1=v1,[n2=v2,...]>: provide arguments to scripts
  --script-args-file=filename: provide NSE script args in a file
  --script-trace: Show all data sent and received
  --script-updatedb: Update the script database.
  --script-help=<Lua scripts>: Show help about scripts.
           <Lua scripts> is a comma-separated list of script-files or
           script-categories.
OS DETECTION:
  -O: Enable OS detection
  --osscan-limit: Limit OS detection to promising targets
  --osscan-guess: Guess OS more aggressively
TIMING AND PERFORMANCE:
  Options which take <time> are in seconds, or append 'ms' (milliseconds),
  's' (seconds), 'm' (minutes), or 'h' (hours) to the value (e.g. 30m).
  -T<0-5>: Set timing template (higher is faster)
  --min-hostgroup/max-hostgroup <size>: Parallel host scan group sizes
  --min-parallelism/max-parallelism <numprobes>: Probe parallelization
  --min-rtt-timeout/max-rtt-timeout/initial-rtt-timeout <time>: Specifies
      probe round trip time.
  --max-retries <tries>: Caps number of port scan probe retransmissions.
  --host-timeout <time>: Give up on target after this long
  --scan-delay/--max-scan-delay <time>: Adjust delay between probes
  --min-rate <number>: Send packets no slower than <number> per second
  --max-rate <number>: Send packets no faster than <number> per second
FIREWALL/IDS EVASION AND SPOOFING:
  -f; --mtu <val>: fragment packets (optionally w/given MTU)
  -D <decoy1,decoy2[,ME],...>: Cloak a scan with decoys
  -S <IP_Address>: Spoof source address
  -e <iface>: Use specified interface
  -g/--source-port <portnum>: Use given port number
  --proxies <url1,[url2],...>: Relay connections through HTTP/SOCKS4 proxies
  --data <hex string>: Append a custom payload to sent packets
  --data-string <string>: Append a custom ASCII string to sent packets
  --data-length <num>: Append random data to sent packets
  --ip-options <options>: Send packets with specified ip options
  --ttl <val>: Set IP time-to-live field
  --spoof-mac <mac address/prefix/vendor name>: Spoof your MAC address
  --badsum: Send packets with a bogus TCP/UDP/SCTP checksum
OUTPUT:
  -oN/-oX/-oS/-oG <file>: Output scan in normal, XML, s|<rIpt kIddi3,
     and Grepable format, respectively, to the given filename.
  -oA <basename>: Output in the three major formats at once
  -v: Increase verbosity level (use -vv or more for greater effect)
  -d: Increase debugging level (use -dd or more for greater effect)
  --reason: Display the reason a port is in a particular state
  --open: Only show open (or possibly open) ports
  --packet-trace: Show all packets sent and received
  --iflist: Print host interfaces and routes (for debugging)
  --append-output: Append to rather than clobber specified output files
  --resume <filename>: Resume an aborted scan
  --stylesheet <path/URL>: XSL stylesheet to transform XML output to HTML
  --webxml: Reference stylesheet from Nmap.Org for more portable XML
  --no-stylesheet: Prevent associating of XSL stylesheet w/XML output
MISC:
  -6: Enable IPv6 scanning
  -A: Enable OS detection, version detection, script scanning, and traceroute
  --datadir <dirname>: Specify custom Nmap data file location
  --send-eth/--send-ip: Send using raw ethernet frames or IP packets
  --privileged: Assume that the user is fully privileged
  --unprivileged: Assume the user lacks raw socket privileges
  -V: Print version number
  -h: Print this help summary page.
EXAMPLES:
  nmap -v -A scanme.nmap.org
  nmap -v -sn 192.168.0.0/16 10.0.0.0/8
  nmap -v -iR 10000 -Pn -p 80
SEE THE MAN PAGE (https://nmap.org/book/man.html) FOR MORE OPTIONS AND EXAMPLES
root@miles-vm:~#
```



## [Nmap扫描教程之基础扫描详解（常用命令）](https://mohen.blog.csdn.net/article/details/85283595?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-8.control&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-8.control)

```
-sT	         TCP connect()扫描，这种方式会在目标主机的日志中记录大批连接请求和错误信息。
-sS	         半开扫描，很少有系统能把它记入系统日志。不过，需要Root权限。
-sF  -sN	 秘密FIN数据包扫描、Xmas Tree、Null扫描模式
-sP	         ping扫描，Nmap在扫描端口时，默认都会使用ping扫描，只有主机存活，Nmap才会继续扫描。
-sU	         UDP扫描，但UDP扫描是不可靠的
-sA	         这项高级的扫描方法通常用来穿过防火墙的规则集
-sV	         探测端口服务版本
-Pn	         扫描之前不需要用ping命令，有些防火墙禁止ping命令。可以使用此选项进行扫描
-v	         显示扫描过程，推荐使用
-h	         帮助选项，是最清楚的帮助文档
-p	         指定端口，如“1-65535、1433、135、22、80”等
-O	         启用远程操作系统检测，存在误报
-A	         全面系统检测、启用脚本检测、扫描等
-oN/-oX/-oG	 将报告写入文件，分别是正常、XML、grepable 三种格式
-T4	         针对TCP端口禁止动态扫描延迟超过10ms
-iL	         读取主机列表，例如，“-iL C:\ip.txt”
 
nmap –iflist : 查看本地主机的接口信息和路由信息
-A ：选项用于使用进攻性方式扫描
-T4： 指定扫描过程使用的时序，总有6个级别（0-5），级别越高，扫描速度越快，但也容易被防火墙或IDS检测并屏蔽掉，在网络通讯状况较好的情况下推荐使用T4
-oX test.xml： 将扫描结果生成 test.xml 文件，如果中断，则结果打不开
-oA test.xml:  将扫描结果生成 test.xml 文件，中断后，结果也可保存
-oG test.txt:  将扫描结果生成 test.txt 文件
-sn : 只进行主机发现，不进行端口扫描
-O : 指定Nmap进行系统版本扫描
-sV: 指定让Nmap进行服务版本扫描
-p <port ranges>: 扫描指定的端口
-sS/sT/sA/sW/sM:指定使用 TCP SYN/Connect()/ACK/Window/Maimon scans的方式来对目标主机进行扫描
-sU: 指定使用UDP扫描方式确定目标主机的UDP端口状况
-script <script name> : 指定扫描脚本
-Pn ： 不进行ping扫描
-sP :  用ping扫描判断主机是否存活，只有主机存活，nmap才会继续扫描，一般最好不加，因为有的主机会禁止ping
-PI :  设置这个选项，让nmap使用真正的ping(ICMP echo请求)来扫描目标主机是否正在运行。
-iL 1.txt : 批量扫描1.txt中的目标地址
 
-sL: List Scan 列表扫描，仅将指定的目标的IP列举出来，不进行主机发现
-sY/sZ: 使用SCTP INIT/COOKIE-ECHO来扫描SCTP协议端口的开放的情况
-sO: 使用IP protocol 扫描确定目标机支持的协议类型
-PO : 使用IP协议包探测对方主机是否开启 
-PE/PP/PM : 使用ICMP echo、 ICMP timestamp、ICMP netmask 请求包发现主机
-PS/PA/PU/PY : 使用TCP SYN/TCP ACK或SCTP INIT/ECHO方式进行发现
 
-sN/sF/sX: 指定使用TCP Null, FIN, and Xmas scans秘密扫描方式来协助探测对方的TCP端口状态
-e eth0：指定使用eth0网卡进行探测
-f : --mtu <val>: 指定使用分片、指定数据包的 MTU.
-b <FTP relay host>: 使用FTP bounce scan扫描方式
-g： 指定发送的端口号
-r: 不进行端口随机打乱的操作（如无该参数，nmap会将要扫描的端口以随机顺序方式扫描，以让nmap的扫描不易被对方防火墙检测到）
-v 表示显示冗余信息，在扫描过程中显示扫描的细节，从而让用户了解当前的扫描状态
-n : 表示不进行DNS解析；
-D  <decoy1,decoy2[,ME],...>: 用一组 IP 地址掩盖真实地址，其中 ME 填入自己的 IP 地址
-R ：表示总是进行DNS解析。 
-F : 快速模式，仅扫描TOP 100的端口 
-S <IP_Address>: 伪装成其他 IP 地址
--ttl <val>: 设置 time-to-live 时间
--badsum: 使用错误的 checksum 来发送数据包（正常情况下，该类数据包被抛弃，如果收到回复，说明回复来自防火墙或 IDS/IPS）
--dns-servers  : 指定DNS服务器
--system-dns : 指定使用系统的DNS服务器   
--traceroute : 追踪每个路由节点 
--scanflags <flags>: 定制TCP包的flags
--top-ports <number> :扫描开放概率最高的number个端口
--port-ratio <ratio>: 扫描指定频率以上的端口。与上述--top-ports类似，这里以概率作为参数
--version-trace: 显示出详细的版本侦测过程信息
--osscan-limit: 限制Nmap只对确定的主机的进行OS探测（至少需确知该主机分别有一个open和closed的端口）
--osscan-guess: 大胆猜测对方的主机的系统类型。由此准确性会下降不少，但会尽可能多为用户提供潜在的操作系统
--data-length <num>: 填充随机数据让数据包长度达到 Num
--ip-options <options>: 使用指定的 IP 选项来发送数据包
--spoof-mac <mac address/prefix/vendor name> : 伪装 MAC 地址
--version-intensity <level>: 指定版本侦测强度（0-9），默认为7。数值越高，探测出的服务越准确，但是运行时间会比较长。
--version-light: 指定使用轻量侦测方式 (intensity 2)
--version-all: 尝试使用所有的probes进行侦测 (intensity 9)
--version-trace: 显示出详细的版本侦测过程信息
```





## exp v1


目标说明：

1）  CIDR风格地址，附加一个/<numbit>在一个IP或主机名后面，则扫描与该IP具有<numbit>相同比特的所有IP地址或主机，支持的numbit值为1-32

2）  可以对IP的各个段使用范围列表来指定扫描对象，即0-255.0-255.0-255.0-255；或使用逗号隔开，即192.168.1.1,3,5

3）  IPv6地址只能用规范的IPv6地址或主机名指定，上面两种方式对IPv6都不支持

4）  接受多个主机说明，不必是相同类型

5）  -iL <inputfilename>：       从列表中输入

6）  -iR <hostnum>：                随机选择目标，hostnum表示目标数目，0意味着永无休止的扫描

7）  --exclude <host1 [, host2] [, host3] …>      排除主机/网络

8）  --excludefile <excludefile>         排除文件中的列表

主机发现

         发送探测包到目标追究，若收到回复，则说明目标主机是开启的。Nmap支持十多种不同的主机探测方式；默认发送四种

a)      ICMP echo request

b)      a TCP SYN packet to port 443

c)      a TCP ACK packet to port 80

d)      an ICMP timestamp request

参数形式

l  -sL：List Scan 列表扫描，仅将指定的目标IP列举出来，不进行主机发现

l  -sP：Ping Scan 只利用ping扫描进行主机发现，不进行端口扫描

n  默认情况下发送ICMP回声请求和一个TCP报文到80端口，非特权用户发送一个SYN报文到80端口

n  可以和除-P0之外的任何发现探测类型-P*选项结合使用以达到更高的灵活性

l  -Pn/-P0：将所有指定的主机视作开启的，跳过主机发现的过程

l  -PS [portlist]：TCP SYN Ping，发送一个设置了SYN标志位的空TCP报文

n  默认端口为80（可设置），也可指定端口

n  目标主机端口关闭，回复RST，端口开放，则回复SYN/ACK，但都表明目标主机在线

n  UNIX机器上，只有特权用户才能发送和接收原始的TCP报文，因此非特权用户进行系统调用connect()，也发送一个SYN报文来尝试建立连接

l  -PA [portlist]：TCP ACK ping，发送一个设置了ACK标志位的TCP报文

n  默认端口为80（可设置），也可指定端口

n  目标主机在线，回复RST，不在线则超时

n  UNIX机器上，只有特权用户才能发送和接收原始的TCP报文，因此非特权用户进行系统调用connect()，也发送一个SYN报文来尝试建立连接

l  -PU [portlist]： UDP Ping，发送一个空的UDP报文到指定的端口，

n  默认短裤为31338（可设置）

n  优势是可以穿越只过滤TCP的防火墙或过滤器

n  若端口关闭，则回复ICMP端口无法到达，说明主机在线；其他类型的ICMP错误如主机/网络无法到达或者TTL超时则表示主机不在线；没有回应也被这样解释，但不一定正确（因为大多数开放该端口的服务会忽略该UDP报文）

l  -PE; -PP; -PM：ICMP Ping Types，发送ICMP Type 8 （回声请求）报文，期待从运行的主机得到一个type 0 （回声相应）报文

l  -PR：ARP Ping

l  -n：不用域名解析，加快扫描速度

l  -R：为所有目标IP地址作反向域名解析

l  --system-dns：使用系统域名解析器，一般不使用该选项，因为比较慢

端口扫描

1）  Nmap将端口分成六个状态

a)        open（开放的）：            该端口正在接收TCP连接或者UDP报文

b)        closed（关闭的）：         关闭的端口接收nmap的探测报文并做出响应

c)        filtered（被过滤的）：   探测报文被包过滤阻止无法到达端口，nmap无法确定端口的开放情况

d)        unfiltered（未被过滤的）：端口可访问，但nmap仍无法确定端口的开放情况

e)        open|filtered（开放或者被过滤的）：无法确定端口是开放的还是被过滤的

f)         closed|filtered（关闭或者被过滤的）：无法确定端口是关闭的还是被过滤的

2）  Nmap产生结果是基于目标机器的响应报文的，而这些主机可能是不可信任的，会产生迷惑或者误导nmap的报文，更普遍的是非RFC兼容的主机以不正确的方式响应nmap探测，FIN/NULL和Xmas扫描特容易遇到这些问题

3）  Nmap支持十几种扫描技术，默认情况下执行一个SYN扫描（没有权限或者扫描IPv6不可用时TCP Connect()）；一般一次只用一种方法，除了UDP扫描(-sU)可能和任何一种TCP扫描结合使用；一般格式是-s<C>，除了deprecatedFTP bounce扫描-b

a)        –sS：TCP SYN扫描，半开放扫描，扫描速度快，不易被注意到（不完成TCP连接）；且能明确区分open|closed|filtered

                        i.             Open         SYN/ACK

                      ii.             Closed       RST复位

                     iii.             Filtered    数次重发没响应，或者收到ICMP不可达

b)        –sT：TCPConnect()，建立连接，容易被记录；对原始报文控制少，效率低

c)        –sU：激活UDP扫描，对UDP服务进行扫描，如DNS/SNMP/DHCP等，可以和TCP扫描结合使用；但是效率低下，开放的和被过滤的端口很少响应，加速UDP扫描的方法包括并发扫描更多的主机，先只对主要端口进行快速扫描，从防火墙后面扫描，使用--host-timeout跳过慢速的主机

d)        –sN; -sF; -sX：TCP Null,Fin, Xmas扫描，从RFC挖掘的微妙方法来区分开放关闭端口；除了探测报文的标志位不同，三种扫描在行为上一致

                        i.             优势：能躲过一些无状态防火墙和报文过滤路由器，比SYN还要隐秘

                      ii.             劣势：现代的IDS产品可以发现，并非所有的系统严格遵循RFC 793

e)        –sA：TCP ACK扫描，只设置ACK标志位，区分被过滤与未被过滤的

f)         –sW：TCP窗口扫描，依赖于互联网上少数系统的实现细节，因此可信度不高；根据窗口大小来判断端口是开放的（正数）还是关闭的（0）

g)        –sM：TCP Maimon扫描，探测报文是FIN/ACK，端口开放或关闭，都对这样的报文响应RST报文，但如果端口开放，许多基于BSD的系统只是丢弃该探测报文

h)        –scanflags：通过指定任意的TCP标志位来设计扫描，可以是数字标记值，也可以使用字符名如URG/ACK/PSH/RST/SYN/FIN

i)          –sI <zombie host[:probeport]>：Idlescan，利用zombie主机上已知IP分段ID序列生成算法来窥探目标上开放端口的信息，极端隐蔽，可以指定端口号，否则默认80

j)          –sO：IP协议扫描，可以确定目标机支持哪些IP协议（TCP, ICMP, IGMP）

k)        –b <ftp relay host>：FTP弹跳扫描

4）  端口说明和扫描顺序：默认情况下，对1-1024以及nmap-services文件中列出的更高的端口在扫描

a)        –p <port ranges>：只扫描指定的端口，单个端口和用连字符表示的端口范围都可以；当既扫描TCP端口又扫描UDP端口时，您可以通过在端口号前加上T: 或者U:指定协议。协议限定符一直有效您直到指定另一个。例如，参数 -p U:53，111，137，T:21-25，80，139，8080 将扫描UDP 端口53，111，和137，同时扫描列出的TCP端口。注意，要既扫描 UDP又扫描TCP，您必须指定 -sU ，以及至少一个TCP扫描类型(如 -sS，-sF，或者 -sT)

b)        –p <name>：扫描指定的端口名称，如nmap–p smtp,http 10.10.1.44

c)        –p U:[UDP ports],T:[TCP ports]：对指定的端口进行指定协议的扫描

d)        –F：快速扫描（仅扫描100个最常用的端口），nmap-services文件指定想要扫描的端口；可以用—datadir选项指定自己的小小nmap-services文件

e)        –top-ports <number>：扫描前number个端口

f)         –r：不要按随机顺序扫描端口，默认情况下按随机（常用的端口前移）

 

服务与版本探测

1）  nmap-services是一个包含大约2200个著名的服务的数据库，Nmap通过查询该数据库可以报告那些端口可能对应于什么服务器，但不一定正确

2）  在用某种扫描方法发现TCP/UDP端口后，版本探测会询问这些端口，确定到底什么服务正在运行；nmap-service-probes数据库包含查询不同服务的探测报文和解析识别响应的匹配表达式；当Nmap从某个服务收到响应，但不能在数据库中找到匹配时，就打印出一个fingerprint和一个URL给您提交

3）  用下列选项打开和控制版本探测

a)        –sV：打开版本探测

b)        –allports：不为版本探测排除任何端口，默认情况下跳过9100端口

c)        –version-intensity<intensity>：设置版本扫描强度，范围为0-9，默认是7，强度越高，时间越长，服务越可能被正确识别

d)        –version-light：是—version-intensity2的别名

e)        –version-all：是—version-intensity9的别名

f)         –version-trace：跟踪版本扫描活动，打印出详细的关于正在进行的扫描的调试信息

g)        –sR：RPC扫描，对所有被发现开放的TCP/UDP端口执行SunRPC程序NULL命令，来试图 确定它们是否RPC端口，如果是， 是什么程序和版本号

 

操作系统探测

1）  用TCP/IP协议栈fingerprinting进行远程操作系统探测，Nmap发送一系列TCP和UDP报文到远程主机，检查响应中的每一个比特。 在进行一打测试如TCPISN采样，TCP选项支持和排序，IPID采样，和初始窗口大小检查之后， Nmap把结果和数据库nmap-os-fingerprints中超过 1500个已知的操作系统的fingerprints进行比较，如果有匹配，就打印出操作系统的详细信息。每个fingerprint包括一个自由格式的关于OS的描述文本，和一个分类信息，它提供供应商名称(如Sun)，下面的操作系统(如Solaris)，OS版本(如10)，和设备类型(通用设备，路由器，switch，游戏控制台等)

2）  Nmap猜不出操作系统，则会提供一个URL让知道操作系统的用户来提交，从而扩大Nmap的操作系统知识库

3）  采用下列选项启用和控制操作系统检测

a)        –O：启用操作系统检测；-A可以同时启用操作系统检测和版本检测

b)        –osscan-limit：针对指定的目标进行操作系统检测

c)        –osscan-guess|--fuzzy：当Nmap无法确定所检测的操作系统时，会尽可能地提供最相近的匹配

 

时间和性能

1）  Nmap开发的最高优先级是性能，但很多因素会增加扫描时间如特定的扫描选项，防火墙配置以及版本扫描灯

2）  优化时间参数

a)        –min-hostgroup <size>;--max-hostgroup <size>：调整并行扫描组的大小，用于保持组的大小在一个指定的范围之内；Nmap具有并行扫描多主机端口或版本的能力，Nmap将多个目标IP地址空间分成组，然后在同一时间对一个组进行扫描。通常，大的组更有效。缺点是只有当整个组扫描结束后才会提供主机的扫描结果

b)        –min-parallelism<milliseconds>; --max-parallelism <millseconds>：调整探测报文的并行度，用于控制主机组的探测报文数量；默认状态下， Nmap基于网络性能计算一个理想的并行度，这个值经常改变

c)        --min-rtt-timeout <milliseconds> --max-rtt-timeout<milliseconds> --initial-rtt-timeout <milliseconds>：调整探测报文超时；Nmap基于上一个探测报文的响应时间来计算超时值，如果网络延迟比较显著和不定，这个超时值会增加几秒。初始值的比较保守(高)，而当Nmap扫描无响应的主机时，这个保守值会保持一段时间

d)        –host-timeout<milliseconds>：放弃低速目标主机；通常使用1800000 来保证Nmap不会在单个主机上使用超过半小时的时间

e)        --scan-delay <milliseconds>; --max-scan-delay<milliseconds>：调整探测报文的时间间隔

f)         –T<Paranoid|Sneaky|Polite|Normal|Aggressive|Insane>：设置时间模板，分别与数字0-5对应；前两种模式用于IDS躲避，Polite模式降低了扫描 速度以使用更少的带宽和目标主机资源。默认模式为Normal，因此-T3 实际上是未做任何优化。Aggressive模式假设用户具有合适及可靠的网络从而加速扫描。Insane模式假设用户具有特别快的网络或者愿意为获得速度而牺牲准确性

 

防火墙/IDS躲避和哄骗

1）  相关的选项

a)        –f（报文分段）; --mtu（使用指定的MTU）：将TCP头分段在几个包中，使得包过滤器、 IDS以及其它工具的检测更加困难

b)        –D <decoy1 [, decoy2] [, ME]…>：使用诱饵隐蔽扫描；使用逗号分隔每个诱饵主机，也可用自己的真实IP作为诱饵，这时可使用 ME选项说明。如果在第6个位置或更后的位置使用ME选项，一些常用端口扫描检测器(如Solar Designer's excellent scanlogd)就不会报告 这个真实IP。如果不使用ME选项，Nmap 将真实IP放在一个随机的位置

c)        –S <IP_Address>：源地址哄骗，说明所需发送包的接口IP地址

d)        –e <interface>：使用指定的接口

e)        –source-port<portnumber>; -g <portnumber>：源端口哄骗；很多产品本身会有这类 不安全的隐患，甚至是微软的产品。Windows 2000和Windows XP中包含的IPsec过滤器也包含了一些隐含规则，允许所有来自88端口(Kerberos)的TCP和UDP数据流。另一个常见的例子是Zone Alarm个人防火墙到2.1.25版本仍然允许源端口53(DNS)或 67(DHCP)的UDP包进入。

f)         –data-length <number>：发送报文时附加随机数据

g)        –ttl <value>：设置IPtime-to-live域

h)        –randomize-hosts：对目标主机的顺序随机排列

i)          –spoof-mac <mac address,prefix, or vendor name>：MAC地址哄骗；要求Nmap在发送原以太网帧时使用指定的MAC地址，这个选项隐含了 --send-eth选项，以保证Nmap真正发送以太网包。MAC地址有几种格式。如果简单地使用字符串“0”，Nmap选择一个完全随机的MAC地址。如果给定的字符品是一个16进制偶数(使用:分隔)，Nmap将使用这个MAC地址。如果是小于12的16进制数字，Nmap会随机填充剩下的6个字节。如果参数不是0或16进制字符串，Nmap将通过nmap-mac-prefixes查找厂商的名称(大小写区分)，如果找到匹配，Nmap将使用厂商的OUI(3字节前缀)，然后随机填充剩余的3个节字。正确的--spoof-mac参数有， Apple， 0，01:02:03:04:05:06， deadbeefcafe，0020F2，和Cisco.

j)          –badsum：发送错误的校验和

 

输出

1）  提供了方便直接查看的交互式方式和方便软件处理的XML格式；另外还提供了选项来控制输出的细节以及调试信息

2）  五种不同的输出格式，默认interactiveoutput，其他的还有

a)        normal output：显示较少的运行时间信息和告警信息

b)        XML输出：可转换成HTML，方便程序处理

c)        grepable格式：在一行中包含目标主机最多的信息

d)        sCRiPt KiDDi3 0utPut 格式：用于考虑自己的用户

多种格式能同时使用，但一种格式只能使用一次

3）  与其它Nmap参数不同，日志文件选项的空格(如-oX)和文件名或连字符是必需的。如果省略了标记，例如-oG-或 -oXscan.xml，Nmap的向后兼容特点将建立 标准格式的输出文件，相应的文件名为G-和 Xscan.xml

4）  相关的选项

a)        –oN <filespec>：标准输出

b)        –oX <filespec>：XML输出写入指定的文件

c)        –oS <filespec>：脚本小子输出，类似于交互工具输出

d)        –oG <filespec>：Grep输出

e)        –oA <basename>：输出至所有格式

f)         –v：提高输出信息的详细度

g)        –d [level]：提高或设置调试级别，9最高

h)        –packet-trace：跟踪发送和接收的报文

i)          –iflist：输出检测到的接口列表和系统路由

j)          –append-output：表示在输出文件中添加，而不是覆盖原文件

k)        –resume <filename>：继续中断的扫描，

l)          –stylesheet <path or URL>：设置XSL样式表，转换XML输出；Web浏览器中打开Nmap的XML输出时，将会在文件系统中寻找nmap.xsl文件，并使用它输出结果

m)      –no-stylesheet：忽略XML生命的XSL样式表

 

其他选项

1）  -6：开启IPv6扫描

2）  -A：激烈扫描模式选项，这个选项启用额外的高级和高强度选项，目前还未确定代表的内容。目前，这个选项启用了操作系统检测(-O) 和版本扫描(-sV)，以后会增加更多的功能

3）  --datadir <directoryname>：说明用户Nmap数据文件位置

Nmap在运行时从文件中获得特殊的数据，这些文件有 nmap-service-probes， nmap-services， nmap-protocols， nmap-rpc， nmap-mac-prefixes和 nmap-os-fingerprints。Nmap首先 在--datadir选项说明的目录中查找这些文件。 未找到的文件，将在BMAPDIR环境变量说明的目录中查找。 接下来是用于真正和有效UID的~/.nmap 或Nmap可执行代码的位置(仅Win32)；然后是是编译位置， 如/usr/local/share/nmap 或/usr/share/nmap。 Nmap查找的最后一个位置是当前目录

4）  --send-eth：使用原以太网帧发送

5）  --send-ip：在原IP层发送

6）  --privileged：假定用户具有全部权限

7）  --interactive：在交互模式下启动

8）  -V; --version：打印版本信息

9）  -h; --help：打印一个短的帮助屏幕

 

运行时的交互

1）  v/V：增加/减少细节

2）  d/D：提高/降低调试级别

3）  p/P：打开/关闭报文跟踪

 

 

NSE脚本引擎(NmapScripting Engine)

1）  允许用户自己编写脚本来执行自动化的操作或者扩展Nmap的功能；使用Lua脚本语言

2）  创建方法

a)        description 字段：描述脚本功能的字符串，使用双层方括号表示

b)        comment 字段：以--开头的行，描述脚本输出格式

c)        author 字段：描述脚本作者

d)        license 字段：描述脚本使用许可证，通常配置为Nmap 相同的license

e)        categories 字段：描述脚本所属的类别，以对脚本的调用进行管理。描述脚本执行的规则，也就是确定触发脚本执行的条件。在 Nmap 中有四种类型的规则，prerule 用于在Nmap 没有执行扫描之前触发脚本执行，这类脚本并不需用到任何Nmap 扫描的结果；hostrule 用在Nmap 执行完毕主机发现后触发的脚本，根据主机发现的结果来触发该类脚本；portrule 用于Nmap 执行端口扫描或版本侦测时触发的脚本，例如检测到某个端口时触发某个脚本执行以完成更详细的侦查。postrule 用于Nmap 执行完毕所有的扫描后，通常用于扫描结果的数据提取和整理。在上述实例中，只有一个portrule，说明该脚本在执行端口扫描后，若检测到TCP 13 号端口开放，那么触发该脚本的执行。

f)         action 字段：脚本执行的具体内容。当脚本通过 rule 字段的检查被触发执行时，就会调用action 字段定义的函数。

3）  用法

a)        –sC：使用默认类别的脚本进行扫描

b)        –script=<Lua scripts>：使用某个或某类脚本进行扫描，支持通配符描述

c)        –script-args=<n1=v1, [n2=v2,…]>：为脚本提供默认参数

d)        –script-args-file=filename：使用文件夹为脚本提供参数

e)        –script-trace：显示脚本执行过程中发送与接收的数据

f)         –script-updatedb：更新脚本数据库

g)        –script-help=<Luascripts>：显示脚本的帮助信息

 

 

后话

1）  Namp的图形化用户界面程序：Zenmap

2）  Nmap扫描的挑战

a)        选取要扫描的IP：网络上有大量的IP地址，需要targeted scans而不是giant scan

b)        防火墙：防火墙内部网络与外部网络的不同，绕过防火墙有一定难度

c)        效率和准确性

3）  TCP主机发现，十个最常用的端口：80/http，25/smtp，22/ssh，443/https，21/ftp，113/auth，23/telnet，53/domain，554/rtsp，3389/ms-term-server

4）  TCP端口扫描，十个最常用的端口：80/http，23/telnet，22/ssh，443/https，3389/ms-term-serv，445/microsoft-ds，139/netbios-ssn，21/ftp，135/msrpc，25/smtp

5）  UDP端口扫描，十个最常用的端口：137/netbios-ns，161/snmp，1434/ms-sql-m，123/ntp，138/netbios-dgm，445/microfost-ds，135/msrpc，67/dhcps，139/netbios-ssn，53/domain

6）  阻止nmap扫描的几种过滤机制，从而nmap扫不到tcp端口和操作系统的版本号，但80端口仍然可以提供好的http服务

a)        iptables –F

b)        iptables -AINPUT -p tcp –tcp-flags ALL FIN,URG,PSH -j Drop

c)        iptables -AINPUT -p tcp –tcp-flags SYN,RST SYN,RST -j Drop

d)        iptables -A INPUT-p tcp –tcp-flags SYN,FIN SYN,FIN -j Drop

e)        iptables -AINPUT -p tcp –tcp-flags SyN SYN –dport 80 -j Drop

针对其他的扫描如UDP扫描，也应该可以设置相应的过滤机制







