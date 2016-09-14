This image runs a torque computing noder with LDAP authentication.
The server name can be configure via the environment variable PBS_SERVER.

LDAP can be configured via the environment variables LDAP_SERVER and LDAP_BASE.

Be sure to set an hostname consistent with the one used on the server.

The home directory is supposed to be on a shared filesystem. The path of the shared home directory (which defaults to /home) can be configured with the environment variable HOME_DIR.

