{%- from "nfs/map.jinja" import server with context %}
{%- if server.enabled %}

nfs_server_packages:
  pkg.installed: 
  - names: {{ server.pkgs }}

nfs_exports_file:
  file.managed:
  - name: /etc/exports
  - source: salt://nfs/files/exports
  - template: jinja
  - user: root
  - group: root
  - mode: 640
  - require:
    - pkg: nfs_server_packages

nfs_service:
  service.running:
  - name: {{ server.nfs_service }}
  - enable: true
  - watch:
    - file: nfs_exports_file

portmap_service:
  service.running:
  - name: {{ server.portmap_service }}
  - enable: true
  - watch:
    - file: nfs_exports_file


{%- endif %}
