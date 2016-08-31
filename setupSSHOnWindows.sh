#!/bin/bash
set -x
#set -e

#Run this script in cygwin using 'sh setupSSHOnWindows.sh' from the terminal

# References:  
# 1.  	http://www.security-plus.co/OpenSSH.txt 
# 2.  	http://www.noah.org/ssh/cygwin-sshd.html
# 3.  	https://bscb.cornell.edu/about/resources/windows-installing-ssh-server
# 4. 	https://github.com/vicrucann/rshell-mat
# 5. 	http://superuser.com/questions/110726/how-to-uninstall-reinstall-cygwin-to-use-sshd

#You may not really need this script now...just run https://github.com/tschutter/AppData

#Preforming the above will automatically set up openssh 
#1. Admin --> cygrunsrv 
#2. Net --> openssh
#3.  Gawk
#Optional
#   Editors --> vim
#   Utilities --> ncurses
#   Net --> curl
#   Net --> wget
#   Net --> rsync

#   *** ---Be sure to run Cygwin as Administrator --- ***
FIREWALL_SERVICE_NAME="SSHD"
CYGWIN_PATH="c:\cygwin64\usr\sbin\sshd.exe"
FIREWALL_PROFILE="private"

#Remove Commands
start_sshd_service() {
	#or net start sshd
	net start sshd
}

stop_sshd_service() {
	net stop sshd
}

remove_sshd_user() {
	net user sshd /delete
}

remove_cyg_server_user() {
	net user cyg_server /delete
}

remove_firewall_exception() {
	netsh advfirewall firewall delete rule name=""$FIREWALL_SERVICE_NAME""
}

#Set up Commands
setup_local_security_authority() {
	echo "yes" | cyglsa-config
}

ssh_host_config() {
	ssh-host-config -y
}

add_firewall_exception() {
	#Add the firewall expection
	netsh advfirewall firewall add rule name=""$FIREWALL_SERVICE_NAME"" dir=in action=allow program=""$CYGWIN_PATH"" profile=""$FIREWALL_PROFILE"" "$FIREWALL_SERVICE_NAME" enable=yes
}

fix_passwd() {
	#In order to harmonize Windows user information with Cygwin
	mkpasswd --local > /etc/passwd
}

fix_groups() {
	#In order to harmonize Windows user information with Cygwin
	mkgroup --local > /etc/group

}

remove_ssh_on_windows() {
	stop_sshd_service
	remove_cygrunsrv_user
	remove_sshd_user
	remove_cyg_server_user
}

setup_ssh_on_windows() {
	ssh_host_config
	fix_passwd
	fix_groups
	setup_local_security_authority
	add_firewall_exception
	stop_sshd_service
	start_sshd_service
}

remove_ssh_on_windows
setup_ssh_on_windows
