

## At SOFTWARE SELECTION menu, you must use the following configurations:
1. In "Base Enviroment" ment select::
    ```
    Server with GUI.
    ```
2. In "Add-Ons for Selected Enviroment" menu select::
    ```
    KDE
    Compatiable Libraries
    Development Tools
    ```
3. Click Done.






## Partion instructions:

1. Legacy mode::
    ```
    /boot           - default xfs 1GB
    /EFI            - vFat, 10GB
    /               - The rest space or set to 100GB(Robert)
    ```

2. UEFI mode::
    ```
    /boot           - default xfs 1GB
    /boot/efi       - 10GB
    /EFI            - vFat, 10GB
    /               - The rest space or set to 100GB(Robert)
    ```





## Steps prior to CTC installation.

1. Config the YUM repository. Configuration::
    ```sh
    mkdir /media/cdrom
    mount /dev/sr0 /mnt
    cp -r /mnt/* /media/cdrom
    ```

    ```sh
    # A sample example.
    [RHEL75]
    name=RHEL7.5
    baseurl=file:/media/cdrom
    enabled=1
    gpgkey=file:/media/cdrom/RPM-GPG-KEY-redhat-release
    gpgckeck=1
    ```

2. Following libraries and binaries must be installed::
    * i686 dependencies
    * dos2unix
    * mesa_libGLU
    * OpenIPMIdriver
    * Iommapd(This should automatically be installed during the CTC installation)

    ```sh
    # run the following commands:
    cd /run/media/root/RHEL*/Packages 

    # yum -y install dos2unix*.rpm
    # yum -y install mesa-libGLU*.rpm
    # yum -y install OpenIPMI-modalias*.rpm
    # yum -y install OpenIPMI-libs*.rpm
    # yum -y install OpenIPMI-*.rpm
    # yum -y install ipmitool-*.rpm
    # yum -y install nvme-cli*

    yum -y install dos2unix mesa-libGLU OpenIPMI-libs OpenIPMI ipmitool nvme-cli 
    yum -y install gcc cmake minicom expect 

    yum -y install OpenIPMI-modalias 
    yum -y install wput screen
    yum -y install ncurses ncurses-devel ncurses-compat-libs libncurses.so.5

    # yum -y remove dos2unix mesa-libGLU OpenIPMI-libs OpenIPMI ipmitool nvme-cli 
    # yum -y remove gcc cmake minicom expect 

    # yum -y remove OpenIPMI-modalias 
    # yum -y remove wput screen

    # (This may take 15 minutes.)
    rpm -ivh --force --nodeps *i686.rpm    
    ```





## BFT test process preparetions::

1. Enable auto login

    ```sh
    # GUI mode
    # Enable auto login.
    # The Daemon section should be empty, add two lines after [daemon]
    [root@debian ~]# vim /etc/gdm/custom.conf
    [daemon]
    AutomaticLoginEnable=true
    AutomaticLogin=root
    ```

    ```sh
    # command line mode

    ```

2. execute BFT Start.sh automatically
    ```sh
    # After booting up, execute WRG_Start.sh automatically.
    [root@debian ~]# vim ~/.bash_profile
    # Add this line at the end of file ``gnome-terminal --full-screen --command "/TEST/WRG_Start.sh"``

        rm -f /LOG/auto-start.log
        fn="ls BFT*Start*.sh | head -n1"
        # fn="BFTStartLinux.sh"
        cd /TEST
        ls -l | tee -a /LOG/auto-start.log
        fn_size=`ls -l ${fn} | awk '{print $5}'`
        echo "Size of ${fn}: ${fn_size}" | tee -a /LOG/auto-start.log
        if [[ ${fn_size} -gt 100 ]]; then
            echo "$fn size is ${fn_size} which is good." | tee -a /LOG/auto-start.log
        else
            # read -p "check point before delete /TEST/$fn"
            echo "Now remvoe $fn as the file size is ${fn_size}, less than 100" | tee -a /LOG/auto-start.log
            rm -f ${fn}
            if [ -s /script/${fn} ]; then
                echo "${fn} is destroyed by accident, now copy a usable StartUp from /script/ folder..." | tee -a /LOG/auto-start.log
                cp -f /script/${fn} .
                sleep 1
            else
                while [ 1 == 1 ]
                do
                    echo -e "\n\n\n"
                    read -p "Detected invalid Linux StartUp script, neither script in floder script nor Test is normal..." | tee -a /LOG/auto-start.log
                    echo -e "\n\n\n"
                done
            fi
        fi

        if [ -s /script/${fn} ] && [ -s ${fn} ]; then
            diff ${fn} /script/${fn}
            if [[ $? -ne 0 ]]; then
                echo "${fn} is different between /TEST and /script, now copy StartUp from /script/ folder..." | tee -a /LOG/auto-start.log
                rm -f ${fn}
                cp -f /script/${fn} .
            else
                echo "$fn has No difference between /TEST and /script" | tee -a /LOG/auto-start.log
            fi
        else
            echo "$fn doesn't exist in either /TEST or /script" | tee -a /LOG/auto-start.log
        fi

        cp ${fn} StartUp.sh
        dos2unix *.sh
        chmod a+x *.sh

        gnome-terminal --full-screen --command "/TEST/StartUp.sh"

    [root@debian ~]# mkdir /TEST
    # Copy the WRG_Start.sh to /TEST folder.
    ```






