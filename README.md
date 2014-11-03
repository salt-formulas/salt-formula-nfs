
# Linux Operating Systems

* Ubuntu - Ubuntu is the world’s favourite free operating system, with more than 20 million people preferring it to commercial alternatives.
* CentOS
* RedHat
* Fedora
* Arch - Arch Linux is a lightweight and flexible Linux distribution that tries to Keep It Simple.

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
                host: 10.10.10.*
                params:
                - rw
                - no_root_squash
                - sync
              pub:
                host: 10.0.0.*
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

linux.storage formula is recommended

## Read more

* http://wiki.ubuntu.cz/nfs
