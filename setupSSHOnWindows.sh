#!/bin/bash
set -x
#set -e

#Run this script in cygwin using './setupSSHOnWindows.sh' from the terminal

# Refs:  
# 1.  	http://www.security-plus.co/OpenSSH.txt 
# 2.  	http://www.noah.org/ssh/cygwin-sshd.html
# 3.  	https://bscb.cornell.edu/about/resources/windows-installing-ssh-server
# 4. 	https://github.com/vicrucann/rshell-mat
# 5. 	http://superuser.com/questions/110726/how-to-uninstall-reinstall-cygwin-to-use-sshd
# 6. 	techtorials.me/cygwin/sshd-configuration/	

#You may not really need this script now...just run https://github.com/tschutter/AppData
#Preforming the above will automatically set up openssh 
#1.	Admin --> cygrunsrv 
#2.	Net --> openssh
#3.	Gawk
#Optional
#	Editors --> vim
#	Utilities --> ncurses
#	Net --> curl
#	Net --> wget
#	Net --> rsync
#   *** ---Be sure to run Cygwin as Administrator --- ***

FIREWALL_SERVICE_NAME="SSHD"
CYGWIN_PATH="c:\cygwin64\usr\sbin\sshd.exe"
FIREWALL_PROFILE="any"

PASSWORD="9d4iPuFucyQ9dT4w"
SSH_PASSPHRASE="test"
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
fix_perms_on_passwd() {
	chmod +r /etc/passwd
	chmod u+w /etc/passwd
}

fix_perms_on_group(){
	chmod +r /etc/group
	chmod u+w /etc/group
}

fix_perms_on_var_file() {
   	chmod 777 /var
}

create_sshd_log_file() {
	touch /var/log/sshd.log
}

edit_sshd_rights_on_windows() {
	editrights -l -u sshd
	editrights -a SeAssignPrimaryTokenPrivilege -u sshd
	editrights -a SeCreateTokenPrivilege -u sshd
	editrights -a SeTcbPrivilege -u sshd
	editrights -a SeServiceLogonRight -u sshd
	editrights -l -u sshd
}

ssh_host_config() {
	ssh-host-config --yes --privileged --user cyg_server --pwd "$PASSWORD"
}

ssh_user_config() {
	ssh-user-config --yes --word "$SSH_PASSPHRASE" 
}

setup_local_security_authority() {
	echo "yes" | cyglsa-config
}

add_firewall_exception() {
	#Add the firewall expection
	netsh advfirewall firewall add rule name=""$FIREWALL_SERVICE_NAME"" dir=in action=allow program=""$CYGWIN_PATH"" profile=""$FIREWALL_PROFILE"" "$FIREWALL_SERVICE_NAME" enable=yes
}

start_sshd_service_in_windows() {
	#or net start sshd
	net start sshd
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

	#fix perms
	fix_perms_on_passwd
	fix_perms_on_group
	fix_perms_on_var_file


	#create log file
	create_sshd_log_file

	#edit sshd rights
	edit_sshd_rights_on_windows
	ssh_host_config
	setup_local_security_authority
	add_firewall_exception
	start_sshd_service_in_windows
}

remove_ssh_on_windows
setup_ssh_on_windows
