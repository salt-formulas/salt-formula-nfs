{%- from "nfs/map.jinja" import client with context %}
{%- if client.enabled %}

nfs_client_packages:
  pkg.installed: 
  - names: {{ client.pkgs }}

{%- for mount_name, mount in client.mount.iteritems() %}

{{ mount.path|replace("/","_") }}_directory:
  file.directory:
  - name: {{ mount.path }}
  - user: root
  - group: root
  - mode: 755
  - makedirs: True
  - unless: test -e {{ mount.path }}
  - require:
    - pkg: nfs_client_packages

{{ mount.path }}:
  mount.mounted:
    - device: {{ mount.device }}
    - fstype: {{ mount.fstype }}
    - require:
      - file: {{ mount.path|replace("/","_") }}_directory
{%- endfor %}

{%- endif %}