# Installs DRAMMS and dependencies imaging tool to container
FROM phusion/baseimage
MAINTAINER Jon McNally <jmcnall3@asu.edu>
RUN apt-get update --fix-missing && apt-get install -y xorg wget
RUN wget http://download.slicer.org/bitstream/263262 -O slicer4.tar.gz
RUN tar -xzvf slicer4.tar.gz -C /opt
RUN ln -s /opt/Slicer-4.4.0-linux-amd64/Slicer /usr/bin/slicer
RUN rm -f /slicer4.tar.gz
#
RUN export uid=userid gid=groupid user=username && \
    groupadd -r ${user} -g ${gid} && \
    useradd -u ${uid} -g ${gid} -G sudo -d /home/${user} -s /bin/bash ${user} && \
    echo "${user} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers
USER username
ENV HOME /home/username
CMD cd ~/ && \
/bin/bash
