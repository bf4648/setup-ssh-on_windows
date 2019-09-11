# Steps to install Open SSH manually on windows

## Download

From the project [website](http://www.mls-software.com/opensshd.html), download the latest binary.

## Install

![openssh001](pngs/openssh001.png)

On the **Welcome** screen click **Next>** to continue.

![openssh002](pngs/openssh002.png)

On the **Licence Agreement** screen select **"I accept the terms of the Licence Agreement"** and click **Next>** to continue.

![openssh003](pngs/openssh003.png)

On the **Choose Components** screen click, **Next>** to continue (there are already all selected).

![openssh004](pngs/openssh004.png)

On the **Choose Install Location** screen click, **Next>** to continue. (Changed the **Destination Folder** if needed)

![openssh005](pngs/openssh005.png)

On the **Choose Start Menu Folder** screen click, **Next>** to continue.

![openssh006](pngs/openssh006.png)

On the **Choose account under which to execute SSHD** screen click, **Next>** to continue.

![openssh007](pngs/openssh007.png)

On the **Choose SSHD priviledge seperation**, **Next>** to continue.

![priledged-account](pngs/priledged-account.png)

On the **Choose port for SSHD daemon** screen click, **Next>** to continue.

![openssh008](pngs/openssh008.png)

On the **Choose key size for key generation** screen click, **Next>** to continue.

![openssh009](pngs/openssh009.png)

On the **Choose user type for SSHD screen** click, **Next>** to continue.

![openssh010](pngs/openssh010.png)

On the **Finish** screen click, **Next>** to continue.

![openssh011](pngs/openssh011.png)

**Note:** the print screens are from Windows 10, but can be install on any Windows version.

**Note:** You will be given a generated password.  Be sure to write that down.

## Verify

Open the Command Prompt window and run the **ssh** command. If the output is similar to the following, you have successfully installed **openSSH** on your **Windows** machine.

```shell
C:\Users\adm>ssh

usage: ssh [-1246AaCfGgKkMNnqsTtVvXxYy] [-b bind_address] [-c cipher_spec]
           [-D [bind_address:]port] [-E log_file] [-e escape_char]
           [-F configfile] [-I pkcs11] [-i identity_file]
           [-J [user@]host[:port]] [-L address] [-l login_name] [-m mac_spec]
           [-O ctl_cmd] [-o option] [-p port] [-Q query_option] [-R address]
           [-S ctl_path] [-W host:port] [-w local_tun[:remote_tun]]
           [user@]hostname [command]

C:\Users\adm>
```


## Log into SSH using your local windows machine account user name and password

You may have to reboot

## Get into cygwin prompt after logging into ssh

```shell
cd c:\tools\cygwin
Cygwin.bat
```
