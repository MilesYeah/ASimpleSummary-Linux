# wget命令

wget命令用于在终端中下载网络文件，格式为“wget [参数] 下载地址”。

如果您没有Linux系统的管理经验，当前只需了解一下wget命令的参数以及作用，然后看一下下面的演示实验即可，切记不要急于求成。后面章节将逐步讲解Linux系统的配置管理方法，可以等您掌握了网卡的配置方法后再来进行这个实验操作。表2-5所示为wget命令的参数以及参数的作用。

| 参数 | 作用                                 |
| ---- | ------------------------------------ |
| -b   | 后台下载模式                         |
| -P   | 下载到指定目录                       |
| -t   | 最大尝试次数                         |
| -c   | 断点续传                             |
| -p   | 下载页面内所有资源，包括图片、视频等 |
| -r   | 递归下载                             |

尝试使用wget命令从本书的配套站点中下载本书的最新pdf格式电子文档，这个文件的完整路径为https://www.linuxprobe.com/docs/LinuxProbe.pdf，执行该命令后的下载效果如下：
```sh
[root@linuxprobe ~]# wget https://www.linuxprobe.com/docs/LinuxProbe.pdf
--2017-08-24 19:30:12 -- https://www.linuxprobe.com/docs/LinuxProbe.pdf
Resolving www.linuxprobe.com (www.linuxprobe.com)... 220.181.105.185
Connecting to www.linuxprobe.com (www.linuxprobe.com)|220.181.105.185|:80...connected.
HTTP request sent, awaiting response... 200 OK
Length: 45948568 (44M) [application/pdf]
Saving to: ‘LinuxProbe.pdf’
100%[===========================================>] 45,948,568 32.9MB/s in 1.3s
2017-08-24 19:30:14 (32.9 MB/s) - ‘LinuxProbe.pdf’ saved [45948568/45948568]
```
接下来，我们使用wget命令递归下载www.linuxprobe.com网站内的所有页面数据以及文件，下载完后会自动保存到当前路径下一个名为www.linuxprobe.com的目录中。执行该操作的命令为wget -r -p https://www.linuxprobe.com，该命令的执行结果如下。
```sh
[root@linuxprobe ~]# wget -r -p https://www.linuxprobe.com
--2017-08-24 19:31:41-- https://www.linuxprobe.com/
Resolving www.linuxprobe.com... 106.185.25.197
Connecting to www.linuxprobe.com|106.185.25.197|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [text/html]
Saving to: 'www.linuxprobe.com/index.html'
………………省略下载过程………………

```


## usage

```sh
GNU Wget 1.14，非交互式的网络文件下载工具。
用法： wget [选项]... [URL]...

长选项所必须的参数在使用短选项时也是必须的。

启动：
  -V,  --version           显示 Wget 的版本信息并退出。
  -h,  --help              打印此帮助。
  -b,  --background        启动后转入后台。
  -e,  --execute=COMMAND   运行一个“.wgetrc”风格的命令。

日志和输入文件：
  -o,  --output-file=FILE    将日志信息写入 FILE。
  -a,  --append-output=FILE  将信息添加至 FILE。
  -d,  --debug               打印大量调试信息。
  -q,  --quiet               安静模式 (无信息输出)。
  -v,  --verbose             详尽的输出 (此为默认值)。
  -nv, --no-verbose          关闭详尽输出，但不进入安静模式。
       --report-speed=TYPE   Output bandwidth as TYPE.  TYPE can be bits.
  -i,  --input-file=FILE     下载本地或外部 FILE 中的 URLs。
  -F,  --force-html          把输入文件当成 HTML 文件。
  -B,  --base=URL            解析与 URL 相关的
                             HTML 输入文件 (由 -i -F 选项指定)。
       --config=FILE         Specify config file to use.

下载：
  -t,  --tries=NUMBER            设置重试次数为 NUMBER (0 代表无限制)。
       --retry-connrefused       即使拒绝连接也是重试。
  -O,  --output-document=FILE    将文档写入 FILE。
  -nc, --no-clobber              skip downloads that would download to
                                 existing files (overwriting them).
  -c,  --continue                断点续传下载文件。
       --progress=TYPE           选择进度条类型。
  -N,  --timestamping            只获取比本地文件新的文件。
  --no-use-server-timestamps     不用服务器上的时间戳来设置本地文件。
  -S,  --server-response         打印服务器响应。
       --spider                  不下载任何文件。
  -T,  --timeout=SECONDS         将所有超时设为 SECONDS 秒。
       --dns-timeout=SECS        设置 DNS 查寻超时为 SECS 秒。
       --connect-timeout=SECS    设置连接超时为 SECS 秒。
       --read-timeout=SECS       设置读取超时为 SECS 秒。
  -w,  --wait=SECONDS            等待间隔为 SECONDS 秒。
       --waitretry=SECONDS       在获取文件的重试期间等待 1..SECONDS 秒。
       --random-wait             获取多个文件时，每次随机等待间隔
                                 0.5*WAIT...1.5*WAIT 秒。
       --no-proxy                禁止使用代理。
  -Q,  --quota=NUMBER            设置获取配额为 NUMBER 字节。
       --bind-address=ADDRESS    绑定至本地主机上的 ADDRESS (主机名或是 IP)。
       --limit-rate=RATE         限制下载速率为 RATE。
       --no-dns-cache            关闭 DNS 查寻缓存。
       --restrict-file-names=OS  限定文件名中的字符为 OS 允许的字符。
       --ignore-case             匹配文件/目录时忽略大小写。
  -4,  --inet4-only              仅连接至 IPv4 地址。
  -6,  --inet6-only              仅连接至 IPv6 地址。
       --prefer-family=FAMILY    首先连接至指定协议的地址
                                 FAMILY 为 IPv6，IPv4 或是 none。
       --user=USER               将 ftp 和 http 的用户名均设置为 USER。
       --password=PASS           将 ftp 和 http 的密码均设置为 PASS。
       --ask-password            提示输入密码。
       --no-iri                  关闭 IRI 支持。
       --local-encoding=ENC      IRI (国际化资源标识符) 使用 ENC 作为本地编码。
       --remote-encoding=ENC     使用 ENC 作为默认远程编码。
       --unlink                  remove file before clobber.

目录：
  -nd, --no-directories           不创建目录。
  -x,  --force-directories        强制创建目录。
  -nH, --no-host-directories      不要创建主目录。
       --protocol-directories     在目录中使用协议名称。
  -P,  --directory-prefix=PREFIX  以 PREFIX/... 保存文件
       --cut-dirs=NUMBER          忽略远程目录中 NUMBER 个目录层。

HTTP 选项：
       --http-user=USER        设置 http 用户名为 USER。
       --http-password=PASS    设置 http 密码为 PASS。
       --no-cache              不在服务器上缓存数据。
       --default-page=NAME     改变默认页
                               (默认页通常是“index.html”)。
  -E,  --adjust-extension      以合适的扩展名保存 HTML/CSS 文档。
       --ignore-length         忽略头部的‘Content-Length’区域。
       --header=STRING         在头部插入 STRING。
       --max-redirect          每页所允许的最大重定向。
       --proxy-user=USER       使用 USER 作为代理用户名。
       --proxy-password=PASS   使用 PASS 作为代理密码。
       --referer=URL           在 HTTP 请求头包含‘Referer: URL’。
       --save-headers          将 HTTP 头保存至文件。
  -U,  --user-agent=AGENT      标识为 AGENT 而不是 Wget/VERSION。
       --no-http-keep-alive    禁用 HTTP keep-alive (永久连接)。
       --no-cookies            不使用 cookies。
       --load-cookies=FILE     会话开始前从 FILE 中载入 cookies。
       --save-cookies=FILE     会话结束后保存 cookies 至 FILE。
       --keep-session-cookies  载入并保存会话 (非永久) cookies。
       --post-data=STRING      使用 POST 方式；把 STRING 作为数据发送。
       --post-file=FILE        使用 POST 方式；发送 FILE 内容。
       --content-disposition   当选中本地文件名时
                               允许 Content-Disposition 头部 (尚在实验)。
       --content-on-error      output the received content on server errors.
       --auth-no-challenge     发送不含服务器询问的首次等待
                               的基本 HTTP 验证信息。

HTTPS (SSL/TLS) 选项：
       --secure-protocol=PR     choose secure protocol, one of auto, SSLv2,
                                SSLv3, TLSv1, TLSv1_1 and TLSv1_2.
       --no-check-certificate   不要验证服务器的证书。
       --certificate=FILE       客户端证书文件。
       --certificate-type=TYPE  客户端证书类型，PEM 或 DER。
       --private-key=FILE       私钥文件。
       --private-key-type=TYPE  私钥文件类型，PEM 或 DER。
       --ca-certificate=FILE    带有一组 CA 认证的文件。
       --ca-directory=DIR       保存 CA 认证的哈希列表的目录。
       --random-file=FILE       带有生成 SSL PRNG 的随机数据的文件。
       --egd-file=FILE          用于命名带有随机数据的 EGD 套接字的文件。

FTP 选项：
       --ftp-user=USER         设置 ftp 用户名为 USER。
       --ftp-password=PASS     设置 ftp 密码为 PASS。
       --no-remove-listing     不要删除‘.listing’文件。
       --no-glob               不在 FTP 文件名中使用通配符展开。
       --no-passive-ftp        禁用“passive”传输模式。
       --preserve-permissions  保留远程文件的权限。
       --retr-symlinks         递归目录时，获取链接的文件 (而非目录)。

WARC options:
       --warc-file=FILENAME      save request/response data to a .warc.gz file.
       --warc-header=STRING      insert STRING into the warcinfo record.
       --warc-max-size=NUMBER    set maximum size of WARC files to NUMBER.
       --warc-cdx                write CDX index files.
       --warc-dedup=FILENAME     do not store records listed in this CDX file.
       --no-warc-compression     do not compress WARC files with GZIP.
       --no-warc-digests         do not calculate SHA1 digests.
       --no-warc-keep-log        do not store the log file in a WARC record.
       --warc-tempdir=DIRECTORY  location for temporary files created by the
                                 WARC writer.

递归下载：
  -r,  --recursive          指定递归下载。
  -l,  --level=NUMBER       最大递归深度 (inf 或 0 代表无限制，即全部下载)。
       --delete-after       下载完成后删除本地文件。
  -k,  --convert-links      让下载得到的 HTML 或 CSS 中的链接指向本地文件。
  --backups=N   before writing file X, rotate up to N backup files.
  -K,  --backup-converted   在转换文件 X 前先将它备份为 X.orig。
  -m,  --mirror             -N -r -l inf --no-remove-listing 的缩写形式。
  -p,  --page-requisites    下载所有用于显示 HTML 页面的图片之类的元素。
       --strict-comments    用严格方式 (SGML) 处理 HTML 注释。

递归接受/拒绝：
  -A,  --accept=LIST               逗号分隔的可接受的扩展名列表。
  -R,  --reject=LIST               逗号分隔的要拒绝的扩展名列表。
       --accept-regex=REGEX        regex matching accepted URLs.
       --reject-regex=REGEX        regex matching rejected URLs.
       --regex-type=TYPE           regex type (posix|pcre).
  -D,  --domains=LIST              逗号分隔的可接受的域列表。
       --exclude-domains=LIST      逗号分隔的要拒绝的域列表。
       --follow-ftp                跟踪 HTML 文档中的 FTP 链接。
       --follow-tags=LIST          逗号分隔的跟踪的 HTML 标识列表。
       --ignore-tags=LIST          逗号分隔的忽略的 HTML 标识列表。
  -H,  --span-hosts                递归时转向外部主机。
  -L,  --relative                  只跟踪有关系的链接。
  -I,  --include-directories=LIST  允许目录的列表。
  --trust-server-names             use the name specified by the redirection
                                   url last component.
  -X,  --exclude-directories=LIST  排除目录的列表。
  -np, --no-parent                 不追溯至父目录。
```


