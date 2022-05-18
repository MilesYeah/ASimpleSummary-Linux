


Ubuntu 18.04系统下设置

1. 允许使用root用户登录桌面
    Ubuntu默认不允许使用root用户登录桌面的,首先需要进行如下配置
    编辑/usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf将该文件的配置修改成如下
    ```conf    
    [Seat:*]
    user-session=ubuntu
    greeter-show-manual-login=true #在登录时允许用户自己输入用户名和密码
    ```

    Ubuntu中的root用户默认是没有设置密码的,所以还需要设置root密码
    ```conf
    sudo passwd root        #在当前桌面登录的用户下执行这条命令修改root密码
    [sudo] user 的密码：     #输入当前登录用户用户user的密码
    输入新的 UNIX 密码：      #输入给root密码
    重新输入新的 UNIX 密码：  #再次输入root密码
    passwd：已成功更新密码
    ```

2. 允许root开机自动登录桌面

    再次编辑/usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf,在该文件末尾添加如下两行
    ```conf
    allow-guset=flase   #禁止访客用户登录
    Autologin-user=root #指定root为自动登录用户
    ```
    编辑完成之后,还需要修改图形桌面配置,编辑文件/etc/gdm3/custom.conf,找到[daemon]项,将该项的配置修改至如下
    ```conf
    [daemon]
    AutomaticLoginEnable=true #启用自动登录
    AutomaticLogin=root       #指定root用户为自动登录用户
    ```
3. 由于Ubuntu默认是禁止使用root用户进行ssh远程登录终端访问的,所以如果需要使用root登录ssh的话则需要再文件中增加如下配置
    ```conf
    PermitRootLogin yes
    ```
4. 重启电脑生效







## ref
* [Linux设置以root用户开机自动登录桌面](https://blog.csdn.net/qq_27187579/article/details/97800354)
* []()
* []()
* []()
* []()
* []()
* []()
