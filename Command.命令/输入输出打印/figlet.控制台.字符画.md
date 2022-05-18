# figlet

figlet [-f fontfile] [-m layoutmode] [-w outputwidth] text
* -f 参数指定字体，可供选择的字体有：lean、block、bub­ble、big、small、mini、script、slant、shadow 等等，你可以在它的官网中查看[字体示例](http://www.figlet.org/examples.html)。


```sh
root@miles-VirtualBox:~# apt install figlet
root@miles-VirtualBox:~# figlet hello
 _          _ _
| |__   ___| | | ___
| '_ \ / _ \ | |/ _ \
| | | |  __/ | | (_) |
|_| |_|\___|_|_|\___/

root@miles-VirtualBox:~#
root@miles-VirtualBox:~# figlet pass

 _ __   __ _ ___ ___
| '_ \ / _` / __/ __|
| |_) | (_| \__ \__ \
| .__/ \__,_|___/___/
|_|
root@miles-VirtualBox:~#
root@miles-VirtualBox:~# figlet failed
  __       _ _          _
 / _| __ _(_) | ___  __| |
| |_ / _` | | |/ _ \/ _` |
|  _| (_| | | |  __/ (_| |
|_|  \__,_|_|_|\___|\__,_|

root@miles-VirtualBox:~#
```


```sh
root@miles-VirtualBox:~# figlet -f lean hello

    _/                  _/  _/
   _/_/_/      _/_/    _/  _/    _/_/
  _/    _/  _/_/_/_/  _/  _/  _/    _/
 _/    _/  _/        _/  _/  _/    _/
_/    _/    _/_/_/  _/  _/    _/_/


root@miles-VirtualBox:~# 
```


