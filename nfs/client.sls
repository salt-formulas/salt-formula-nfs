{%- from "nfs/map.jinja" import client with context %}
{%- if client.enabled %}

nfs_client_packages:
  pkg.installed:
  - names: {{ client.pkgs }}

{%- for mount_name, mount in client.mount.iteritems() %}

{{ mount.path|replace("/","_") }}_directory:
  file.directory:
  - name: {{ mount.path }}
  - makedirs: True
  - require:
    - pkg: nfs_client_packages

{{ mount.path|replace("/","_") }}_nfs_mount:
  mount.mounted:
    - name: {{ mount.path }}
    - device: {{ mount.device }}
    - fstype: {{ mount.fstype }}
    - require:
      - file: {{ mount.path|replace("/","_") }}_directory
{%- endfor %}

{%- endif %}
