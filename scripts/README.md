# Getting started

## Update:  There is an easier way now: 

* Install open ssh using the following link: [open-ssh-on-windows](https://www.admfactory.com/how-to-install-openssh-on-windows/)

* Go through the process of going through the installation and choose to install SSHD as a server 
* Once you get in using ssh, go to cygwin dir and execute the Cygwin.bat to get into cygwin

```shell
cd C:\tools\cygwin
Cygwin.bat
```

1. Install Cygwin (after install chocoately) in an Admin Command Prompt:

```shell
choco install cygwin -y
```

2. Install the following programs within cygwin in an Admin Command Prompt Window:

```shell
choco install cygrunsrv openssh vim ncurses curl wget rsync lynx nmap unzip tree realpath git -y --source=cygwin
```

3. Clone the repo in the cygwin terminal

```
mkdir ~/git
cd ~/git
git clone https://github.com/bf4648/setup-ssh-on_windows
```

4. Create a default ssh key

```
ssh-keygen.exe
```

5. Open the cygwin terminal as an administrator
6. Execute the setupSSHOnWindows.sh script

```
cd ~/git/setup-ssh-on_windows
chmod +x setupSSHOnWindows.sh
./setupSSHOnWindows.sh
```

7. If you are using virtualbox, be sure to change your network to a 'NAT Network'

8. To log in using ssh use the windows user name and windows password of the user

```
ssh windows_user@windows_ip 
```

9. If you are using a NAT virtualbox you will need to set up port forwarding 

[port-forwarding-on-nat](https://stackoverflow.com/questions/15580525/virtualbox-port-forwarding-not-working-with-nat-adapter)

[port-forwarding-on-windows](https://www.howtogeek.com/122641/how-to-forward-ports-to-a-virtual-machine-and-use-it-as-a-server/)

To get the name of the vm that is running: 

```shell
VboxManage list vms

```

To modify vbox:

```shell
VBoxManage modifyvm "Windows10" --natpf1 ",tcp,,22,,22"
```

* Note: chocolately default installation directory is: C:\ProgramData\chocolatey
* Programs are installed: C:\tools
* If you having permission problems: [permission-problems-in-cygwin](http://georgik.rocks/how-to-fix-incorrect-cygwin-permission-inwindows-7/)


## Refs:  

[open-ssh](http://www.security-plus.co/OpenSSH.txt)

[cygwin-sshd](http://www.noah.org/ssh/cygwin-sshd.html)

[windows-installing-ssh-server](https://bscb.cornell.edu/about/resources/windows-installing-ssh-server)

[rshell-mat](https://github.com/vicrucann/rshell-mat)

[how-to-uninstall-cygwin](http://superuser.com/questions/110726/how-to-uninstall-reinstall-cygwin-to-use-sshd)

[sshd-configuration](techtorials.me/cygwin/sshd-configuration/)
