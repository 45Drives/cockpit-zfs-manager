# Cockpit ZFS Manager

[![GitHub Tag](https://img.shields.io/github/v/release/45drives/cockpit-zfs-manager?include_prereleases&style=flat-square&color=brightgreen)](https://github.com/45drives/cockpit-zfs-manager/releases)

**An interactive ZFS on Linux admin package for Cockpit.**
## Requirements

 * Cockpit: 201+
 * NFS (Optional)
 * Samba: 4+ (Optional)
 * ZFS: 0.8+
 
 <details>
  <summary>Tested Distributions</summary>
  
  * Ubuntu 20.04 LTS
  
</details>

## Installation

Copy zfs folder to cockpit

```bash
$ git clone https://github.com/45drives/cockpit-zfs-manager.git
$ sudo cp -r cockpit-zfs-manager/zfs /usr/share/cockpit
```

#### Samba

Auto generated snapshot names are created in YYYY.MM.DD-HH.MM.SS format.

It is recommended to add the following properties to the Samba configuration file to allow access to Previous Versions in Windows Explorer:

```bash
$ sudo nano /etc/samba/smb.conf
```

Append to [global] section or individual share sections

```
shadow: snapdir = .zfs/snapshot
shadow: sort = desc
shadow: format = %Y.%m.%d-%H.%M.%S
shadow: localtime = yes	
vfs objects = acl_xattr shadow_copy2
```

## Using Cockpit ZFS Manager

Login to Cockpit as a privileged user and click ZFS from the navigation list.

A Welcome to Cockpit ZFS Manager modal will display and allow you to configure initial settings.

Note: Inline help is currently available in modals. Documentation will be created at a later date.


## Notes

#### Storage Pools

New storage pools are created with the following properties set (not visible in Create Storage Pool modal):

 * aclinherit=passthrough
 * acltype=posixacl
 * casesensitivity=sensitive
 * normalization=formD
 * sharenfs=off
 * sharesmb=off
 * utf8only=on
 * xattr=sa

#### File Systems

New file systems are created with the following properties set (not visible in Create File System modal):

 * normalization=formD
 * utf8only=on

Passphrase is currently supported for encrypted file systems.

If SELinux contexts for Samba is selected, the following properties are set:

 * context=system_u:object_r:samba_share_t:s0
 * fscontext=system_u:object_r:samba_share_t:s0
 * defcontext=system_u:object_r:samba_share_t:s0
 * rootcontext=system_u:object_r:samba_share_t:s0

#### Samba

ZFS always creates shares in /var/lib/samba/usershares folder when ShareSMB property is enabled. This is also the case even if Cockpit ZFS Manager is managing the shares. To avoid duplicate shares of the same file system, it is recommended to configure a different usershares folder path if required or to disable usershares in the Samba configuration file.

If enabled, Cockpit ZFS Manager manages shares for the file systems only. Samba global configuration will need to be configured externally.
