#!/bin/bash
# Remove sshd service
# Ref: http://superuser.com/questions/110726/how-to-uninstall-reinstall-cygwin-to-use-the-sshd

cygrunsrv --stop sshd
cygrunsrv --remove sshd
# Delete any sshd or related users (such as cyg_server) from /etc/passwd
#   (use your favorite editor)
# Delete any sshd or relaged users (such as cyg_server) from the system
net user sshd /delete
net user cyg_server /delete

#Notes
delete LOCAL_MACHINE\SYSTEM\ControlSet001\services\sshd
run 'sc delete sshd'
reboot
