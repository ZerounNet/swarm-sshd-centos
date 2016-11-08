FROM centos

MAINTAINER ZerounNet

RUN yum --setopt=tsflags=nodocs -y install openssh-server openssh-clients which net-tools bind-utils sysvinit-tools iproute lsof ; \
    yum clean all ; \
    (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -vf /lib/systemd/system/multi-user.target.wants/*; \
    rm -vf /etc/systemd/system/*.wants/*; \
    rm -vf /lib/systemd/system/local-fs.target.wants/*; \
    rm -vf /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -vf /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -vf /lib/systemd/system/basic.target.wants/*; \
    rm -vf /lib/systemd/system/anaconda.target.wants/*; \
    rm -rvf /etc/ssh/ssh_host_*_key* ; \
    ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa ; \
    ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa ; \
    ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa ; \
    ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519 ; \
    echo 'StrictHostKeyChecking no' >> /etc/ssh/ssh_config ; \
    echo 'UserKnownHostsFile /dev/null' >> /etc/ssh/ssh_config ; \
    echo 'UseDNS no' >> /etc/ssh/sshd_config ;

CMD ["/usr/sbin/sshd","-D"]
