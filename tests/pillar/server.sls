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