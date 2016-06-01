This image runs a torque server with LDAP authentication and an ssh server.
The file containing the list of nodes should be mounted as a volume at /var/spool/torque/server_priv/nodes.

LDAP can be configured via the environment variables LDAP_SERVER and LDAP_BASE.

Be sure to set an hostname consistent with the one used on the nodes.
