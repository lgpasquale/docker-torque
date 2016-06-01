echo -e "BASE ${LDAP_BASE}\nURI ${LDAP_SERVER}" > /etc/nslcd.conf
for item in passwd shadow group; do
    sed -i "s/${item}:.*/${item}: files ldap/g" /etc/nsswitch.conf
done
#initgroups needs to be commented otherwise secondary groups don't work
sed -i "s/\(initgroups:.*\)/\#\1/g" /etc/nsswitch.conf
/usr/sbin/nslcd

hostname -f > /var/spool/torque/server_name
/usr/local/sbin/trqauthd &
yes|$(ls -d torque*)/torque.setup root

/usr/local/sbin/pbs_sched -d ${PBS_HOME}

/usr/sbin/sshd-keygen
/usr/sbin/sshd

while true; do
    tail -f /var/spool/torque/server_logs/$(ls /var/spool/torque/server_logs/|head -n1);
done
