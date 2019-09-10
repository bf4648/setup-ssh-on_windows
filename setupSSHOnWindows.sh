#!/bin/bash
set -x
#set -e

#Run this script in cygwin using './setupSSHOnWindows.sh' from the cygwin terminal
FIREWALL_SERVICE_NAME="SSHD"
CYGWIN_PATH="c:\cygwin64\usr\sbin\sshd.exe"
FIREWALL_PROFILE="any"
PASSWORD="9d4iPuFucyQ9dT4w"
SSH_PASSPHRASE="test"

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
generate_passwd_file() {
	mkpasswd -l -p "$(cygpath -H)" > /etc/passwd
}

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

correct_file_perms_on_ssh_file() {
	chmod 700 ~/.ssh
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
	# generate passwd file
	generate_passwd_file
	
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
	correct_file_perms_on_ssh_file
}

remove_ssh_on_windows
setup_ssh_on_windows
