# Getting started

1. Install the following programs in cygwin:

```
cygrunsrv 
openssh
git
vim
ncurses
curl
wget
rsync
lynx
```

You can also just use chocolately

```
choco install cygwin
choco install cygrunsrv openssh git vim ncurses curl wget rsync lynx --source=cygwin
```

2. Clone the repo in the cygwin terminal

```
mkdir ~/git
cd ~/git
git clone https://github.com/bf4648/setup-ssh-on_windows
```

3. Open the cygwin terminal as an administrator
4. Execute the setupSSHOnWindows.sh script

```
cd ~/git/setup-ssh-on_windows
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
