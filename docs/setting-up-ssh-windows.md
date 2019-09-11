# B Setting Up SSH (SSHD) Server on Microsoft Windows [settingup-ssh-on-windows](https://docs.oracle.com/cd/E23562_01/doc.1035/e14501/install.htm)

Before starting with the SSHD setup, ensure you are not using OpenSSH and MKSNT when using the Mass Deployment Utility. The Mass Deployment Utility uses the complete Cygwin suite (full collection of the software tools packaged in Cygwin). To get the complete collection of Cygwin, do the following:

Ensure OpenSSH\bin and mksnt are not in your %PATH%. If they are, remove them by doing the following:

Right-click on My Computer and go to Properties.

In the System Properties window that appears, click Advanced.

In this tab, click Environment Variables.

Here, search for the Path system variable, select it, and if the OpenSSH\bin and mksnt are present in the PATH, click Edit.

In the Edit System Variable dialog box that appears, delete these two values from the PATH, and click OK.

Now, stop the SSH Daemon if it is running from OpenSSH. To do this:

Right-click on My Computer, and select Manage.

In the Computer Management window that appears, go to Services under Services and Applications.

In the right-pane, select the SSH daemon service and click the Stop Service icon.

Note: Ensure you rename the installation directories of OpenSSH and MKSNT. Also remove the Cygnus Solutions Key (HKEY_LOCAL_MACHINE\SOFTWARE\Cygnus Solutions) from the Registry. To do it, go to a windows command prompt, type regedit. It will open the Registry Editor. Search for the Cygnus Solutions key under SOFTWARE, which is under HKEY_LOCAL_MACHINE). Right click Cygnus Solutions entry in the Registry tree, click Delete and confirm yes.

To install the full suite of Cygwin software, go to http://www.cygwin.com, and install Cygwin in your C:\cygwin directory.

While installing Cygwin, ensure you choose the following binaries:

Zip, unzip binaries from the Archive package.

OpenSSH and dependencies (automatically selected if you choose OpenSSH) from the Net package.

Ensure that the c:\cygwin\bin path is before any other path in the PATH system environment variable.

Once openSSH is installed, open a cygwin bash shell and invoke the following commands.

chmod +r  /etc/passwd
chmod +r  /etc/group
chmod  755  /var
Open a new command prompt and execute the following:

bash
ssh-host-config -y
The -y option will assume yes for all questions and proceed.Choose the default option if asked for value for CYGWIN environment variable.Choose the default option if asked for permission while overwriting '/etc/sshd_config'.

Create passwd and group entries by typing the following in cygwin bash shell:

mkgroup -d <DOMAIN_NAME> >> /etc/group
mkpasswd -u <USER> -d <DOMAIN_NAME >> /etc/passwd
For local users, type:

mkpasswd   -cl  <USER> >>   /etc/passwd
mkgroup   --local    >>   /etc/group
Start the SSH daemon.

/usr/sbin/sshd

Alternatively, from the same BASH prompt, you can also execute:

cygrunsrv -S sshd

Note: Use cygrunsrv -E sshd to stop the SSH daemon.

You can now test your cygwin setup. To do this, go to a different machine (that has the ssh client), and execute the following command:

ssh -l <USERNAME> <your Windows machine name> 'date
or from your Windows machine

ssh -l <USERNAME> <your Windows machine name> 'date'
For example,

ssh -l pjohn egal07.db.funds.com 'date'
This command will prompt you to specify the password. When you specify the correct password, the command should return the accurate date.


