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

## Clone the repo in the cygwin terminal

```
git clone https://github.com/bf4648/setup-ssh-on_windows
```

## Run the cygwin as Administrator and executing the setupSSHOnWindows.sh script

```
./setupSSHOnWindows.sh
```

## To get logging in working after running the script
### Set the permisssion of the ~/.ssh file in cygwin

```
chmod 700 ~/.ssh
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
