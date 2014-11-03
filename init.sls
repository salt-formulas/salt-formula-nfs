{%- if pillar.nfs is defined %}
include:
{%- if pillar.nfs.server is defined %}
- nfs.server
{%- endif %}
{%- if pillar.nfs.client is defined %}
- nfs.client
{%- endif %}
{%- endif %}