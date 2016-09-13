authconfig --enableldap --enableldapauth --ldapserver=${LDAP_SERVER} --ldapbasedn=${LDAP_BASE} --update
#initgroups needs to be commented otherwise secondary groups don't work
sed -i "s/\(initgroups:.*\)/\#\1/g" /etc/nsswitch.conf
/usr/sbin/nslcd

hostname -f > /var/spool/torque/server_name
/usr/local/sbin/trqauthd &
#yes|$(ls -d torque*)/torque.setup root

echo -e "\$pbsserver $PBS_SERVER\n\$logevent 225\n\$log_keep_days 5" > /var/spool/torque/mom_priv/config

/usr/local/sbin/pbs_mom -d ${PBS_HOME}

while true; do
    tail -f /var/spool/torque/mom_logs/$(ls /var/spool/torque/mom_logs/|head -n1);
done

