FROM centos:7.3.1611
MAINTAINER mtt0 retmain@foxmail.com

ENV TZ=UTC

RUN \
  yum update -y && \
  yum install ntp -y&& \
  yum autoremove -y && \
  yum clean all && \
  rm -rf /var/cache/yum

RUN \
  echo "SYNC_HWCLOCK=yes" >> /etc/sysconfig/ntpd

EXPOSE 123/udp

CMD ["/usr/sbin/ntpd", "-n"]

