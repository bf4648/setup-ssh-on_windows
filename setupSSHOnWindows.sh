#!/bin/bash

#Run this script in cygwin using 'sh setupSSHOnWindows.sh' from the terminal

# References:  
# 1.  http://www.security-plus.co/OpenSSH.txt 
# 2.  http://www.noah.org/ssh/cygwin-sshd.html
# 3.  https://bscb.cornell.edu/about/resources/windows-installing-ssh-server

#You may not really need this script now...just run https://github.com/tschutter/AppData

#Preforming the above will automatically set up openssh 
#1. Admin --> cygrunsrv 
#2. Net --> openssh
#Optional
#   Editors --> vim
#   Utilities --> ncurses
#   Net --> curl
#   Net --> wget
#   Net --> rsync

#   *** ---Be sure to run Cygwin as Administrator --- ***

ssh-host-config -y
cygrunsrv -S sshd

#In order to harmonize Windows user information with Cygwin
mkpasswd --local > /etc/passwd
mkgroup --local > /etc/group

#Add the firewall expection
netsh advfirewall firewall add rule name="SSHD" dir=in action=allow program="c:\cygwin64\usr\sbin\sshd.exe" profile="private" SSHD enable=yes
