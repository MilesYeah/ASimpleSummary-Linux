# toilet

root@miles-VirtualBox:~# sudo apt install toilet



toilet [-f fontfile] [-F filter] [-w outputwidth] text
* -f 参数指定字体文件，预置的字体可以在 /usr/share/figlet 目录找到。
* -F 参数指定过滤器，
* --metal 或 --gay 指定金属样式或彩虹样式。
* -w 参数指定输出宽度，默认为 80，超过设定值将会被截断。
* 以上仅列出了部分参数，完整功能可以通过 man toilet 查阅。


```sh
root@miles-VirtualBox:~# toilet baidu.com

 #               "        #
 #mmm    mmm   mmm     mmm#  m   m          mmm    mmm   mmmmm
 #" "#  "   #    #    #" "#  #   #         #"  "  #" "#  # # #
 #   #  m"""#    #    #   #  #   #         #      #   #  # # #
 ##m#"  "mm"#  mm#mm  "#m##  "mm"#    #    "#mm"  "#m#"  # # #


root@miles-VirtualBox:~# toilet baidu.com --gay                     # 实际输出为彩色

 #               "        #
 #mmm    mmm   mmm     mmm#  m   m          mmm    mmm   mmmmm
 #" "#  "   #    #    #" "#  #   #         #"  "  #" "#  # # #
 #   #  m"""#    #    #   #  #   #         #      #   #  # # #
 ##m#"  "mm"#  mm#mm  "#m##  "mm"#    #    "#mm"  "#m#"  # # #


root@miles-VirtualBox:~# toilet baidu.com -f smblock
▌     ▗   ▌
▛▀▖▝▀▖▄ ▞▀▌▌ ▌  ▞▀▖▞▀▖▛▚▀▖
▌ ▌▞▀▌▐ ▌ ▌▌ ▌▗▖▌ ▖▌ ▌▌▐ ▌
▀▀ ▝▀▘▀▘▝▀▘▝▀▘▝▘▝▀ ▝▀ ▘▝ ▘
root@miles-VirtualBox:~# toilet baidu.com -f smblock -F metal           # 实际输出为金属风彩色
▌     ▗   ▌
▛▀▖▝▀▖▄ ▞▀▌▌ ▌  ▞▀▖▞▀▖▛▚▀▖
▌ ▌▞▀▌▐ ▌ ▌▌ ▌▗▖▌ ▖▌ ▌▌▐ ▌
▀▀ ▝▀▘▀▘▝▀▘▝▀▘▝▘▝▀ ▝▀ ▘▝ ▘
root@miles-VirtualBox:~# 
```


