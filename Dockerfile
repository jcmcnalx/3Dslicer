# Installs 3Dslicer imaging tool to container  credit to http://www.slicer.org/ and http://phusion.github.io/baseimage-docker/
FROM jmcnall3/3dslicer4			# Built on Phusion Baseimage Ubuntu 14.04
MAINTAINER Jon McNally <jmcnall3@asu.edu>
RUN export uid=userid gid=groupid user=username && \
    groupadd -r ${user} -g ${gid} && \
    useradd -u ${uid} -g ${gid} -G sudo -d /home/${user} -s /bin/bash ${user} && \
    echo "${user} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers
USER username
ENV HOME /home/username
CMD cd ~/ && \
/bin/bash
