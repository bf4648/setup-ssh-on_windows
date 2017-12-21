# Getting started

## Install the correct programs in cygwin

```
cygrunsrv 
openssh
git
vim
ncurses
curl
wget
rsync
```

You can also just use chocolately

```
choco install cygwin
choco install cyg-get
```

### Open Cygwin terminal and enter in the following command

```
cyg-get.bat install cygrunsrv openssh git vim ncurses curl wget rsync
```

## Clone the repo in the cygwin terminal

```
git clone https://github.com/bf4648/setup-ssh-on_windows
```

## Run cygwin as Administrator and execute the setupSSHOnWindows.sh script

```
./setupSSHOnWindows.sh
```

## To log in using ssh use the windows user name and windows password of the user

```
ssh windows_user@windows_ip 
```

## Refs:  

[open-ssh](http://www.security-plus.co/OpenSSH.txt)

[cygwin-sshd](http://www.noah.org/ssh/cygwin-sshd.html)

[windows-installing-ssh-server](https://bscb.cornell.edu/about/resources/windows-installing-ssh-server)

[rshell-mat](https://github.com/vicrucann/rshell-mat)

[how-to-uninstall-cygwin](http://superuser.com/questions/110726/how-to-uninstall-reinstall-cygwin-to-use-sshd)

[sshd-configuration](techtorials.me/cygwin/sshd-configuration/)
