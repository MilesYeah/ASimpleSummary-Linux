
# 开启root账户登录


Ubuntu默认是没有开启root账户登录选项的，想要在启动系统时用root账户登录系统，需要自己进行额外的设置。

## STEP 1

首先设置root账户的密码。
```
sudo passwd root
```


执行命令后，首先输入当前账户密码，确认无误后，系统会提示Enter new UNIX password，这是root密码，自行设置。注意在Ubuntu的命令行中，输入的密码是不可见的，只需要输入之后回车即可。

## STEP 2

对于14.0版本及以上的系统，在命令行输入：
```
sudo gedit /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf
```

然后编辑50-ubuntu.conf文件，在文件尾添加两行代码：
```
greeter-show-manual-login=true      #手工输入登陆系统的用户名和密码
allow-guest=false         #不允许guest登录（可选）
```


对于12.0版本的系统，在命令行输入：
```
sudo gedit /etc/lightdm/lightdm.conf
```


然后编辑文件，后续操作步骤同上。

保存退出，重启系统。

然后在登录框，输入用户名root


回车，输入刚才设置的root密码即可。


————————————————
版权声明：本文为CSDN博主「亲亲Friends」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/u014261408/java/article/details/89981549