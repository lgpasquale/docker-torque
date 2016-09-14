FROM centos:7

MAINTAINER Luca Pasquale

RUN yum -y install libtool openssl-devel libxml2-devel boost-devel gcc gcc-c++ wget
RUN wget http://www.adaptivecomputing.com/index.php?wpfb_dl=3032 -O torque-6.0.1.tar.gz
RUN tar -xf torque-6.0.1.tar.gz && rm torque-6.0.1.tar.gz
RUN yum -y group install "Development Tools"
RUN cd $(ls -d torque*)/ && \
    ./configure && \
    make && \
    make install

RUN yum -y install initscripts openssh openssh-server nfs-utils openldap-clients nss-pam-ldapd vim authconfig

COPY init.sh /init.sh
RUN chmod u+x /init.sh

ENV PBS_HOME=/var/spool/torque

EXPOSE 15001
EXPOSE 22

CMD /init.sh
