FROM registry.access.redhat.com/ubi8/ubi-init

LABEL maintainer="timkids"

RUN yum --disableplugin=subscription-manager update -y; \
    yum --disableplugin=subscription-manager -y install systemd systemd-sysv; \
    yum --disableplugin=subscription-manager install -y java-11-openjdk; \
    yum --disableplugin=subscription-manager clean all ;\
    rm -rf /tmp/* /var/tmp/* ; \
    rm -rf /lib/systemd/system/multi-user.target.wants/* ; \
    rm -rf /etc/systemd/system/*.wants/* ; \
    rm -rf /lib/systemd/system/local-fs.target.wants/* ; \
    rm -rf /lib/systemd/system/sockets.target.wants/*udev* ; \
    rm -rf /lib/systemd/system/sockets.target.wants/*initctl* ; \
    rm -rf /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* ; \
    rm -rf /lib/systemd/system/systemd-update-utmp*

VOLUME ["/sys/fs/cgroup", "/tmp", "/run"]

CMD ["/lib/systemd/systemd"]