
===========
NFS Formula
===========

Sample Pillars
==============

NFS Server: Basic sharing

.. code-block:: yaml

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

NFS Client with mounted directory

.. code-block:: yaml

    nfs:
      client:
        enabled: true
        mount:
          samba1:
            path: /media/myuser/public/
            fstype: nfs
            device: 192.168.0.1:/home/majklk

NFS mount

.. code-block:: yaml

    linux:
      storage:
        mount:
          nfs:
            enabled: true
            path: /var/lib/glance
            file_system: nfs
            device: 10.0.103.152:/storage/glance/vpc20

More Information
================

* http://wiki.ubuntu.cz/nfs
