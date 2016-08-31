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
FIREWALL_PROFILE="any"

#TODO: go through the following tutorial and fix my code
# techtorials.me/cygwin/sshd-configuration/	

#Remove Commands
stop_sshd_service_in_cygwin() {
	cygrunsrv --stop sshd
}

remove_sshd_user_in_cygwin() {
	cygrunsrv --remove sshd
}

remove_sshd_user_from_passwd() {
	sed -i /sshd/d /etc/passwd
}

remove_cyg_server_user_from_passwd() {
	sed -i /cyg_server/d /etc/passwd
}

remove_sshd_user_in_windows() {
	net user sshd /delete
}

remove_cyg_server_user_in_windows() {
	net user cyg_server /delete
}

remove_firewall_exception() {
	netsh advfirewall firewall delete rule name=""$FIREWALL_SERVICE_NAME""
}

#Set up Commands
start_sshd_service_in_windows() {
	#or net start sshd
	net start sshd
}

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

fix_perms() {
	
	chmod +r /etc/passwd
	chmod u+w /etc/passwd
	chmod +r /etc/passwd

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
	#ref: http://superuser.com/questions/110726/how-to-uninstall-reinstall-cygwin-to-use-sshd
	stop_sshd_service_in_cygwin
	remove_sshd_user_in_cygwin
	remove_sshd_user_from_passwd
	remove_cyg_server_user_from_passwd
	remove_sshd_user_in_windows
	remove_cyg_server_user_in_windows
	remove_firewall_exception
}

setup_ssh_on_windows() {
	ssh_host_config
	fix_passwd
	fix_groups
	setup_local_security_authority
	add_firewall_exception
	start_sshd_service_in_windows
}

remove_ssh_on_windows
setup_ssh_on_windows
