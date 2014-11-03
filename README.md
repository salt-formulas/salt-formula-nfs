
# NFS Network File System

## Sample pillars

### NFS Server

Basic NFS sharing

    nfs:
      server:
        enabled: true
        share:
          home_majklk:
            path: /home/majklk
            host: 
              inter:
                host: 10.10.10.0/24
                params:
                - rw
                - no_root_squash
                - sync
              pub:
                host: 10.0.0.0/24
                params:
                - rw
                - no_root_squash
                - sync

### NFS Client with mounted directory

    nfs:
      client:
        enabled: true
        mount:
          samba1:
            path: /media/myuser/public/
            fstype: nfs
            host: //192.168.0.1/storage

note: this formula enforce mount path if not exist !

linux.storage formula is recommended

## Supported OS

* Ubuntu 14.04

## Read more

* http://wiki.ubuntu.cz/nfs
