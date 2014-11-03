{%- from "nfs/map.jinja" import client with context %}
{%- if client.enabled %}

nfs_client_packages:
  pkg.installed: 
  - names: {{ client.pkgs }}

{%- for mount_name, mount in client.mount.iteritems() %}
{{ mount.path }}:
  mount.mounted:
    - device: {{ mount.device }}
    - fstype: {{ mount.fstype }}
{%- endfor %}

{%- endif %}