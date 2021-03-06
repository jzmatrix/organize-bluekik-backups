FROM jzmatrix/debian-baseimage
################################################################################
RUN apt update && \
    apt -y install libyaml-tiny-perl liblwp-protocol-https-perl libjson-perl libcryptx-perl libmime-lite-html-perl libmime-tools-perl libmail-imapclient-perl libdate-calc-perl

##
RUN  apt-get autoremove && \
     apt-get clean && \
     apt-get autoclean && \
     rm -rf /var/lib/apt/lists/* && \
     mkdir /opt/sslUpdate && \
     mkdir /var/run/sshd && \
     chmod 0755 /var/run/sshd && \
     mkdir /opt/organizeKik
################################################################################
ADD scripts /opt/organizeKik/
RUN chmod 755 -R /opt/organizeKik/
################################################################################
CMD ["/opt/organizeKik/organizeFiles"]   # Used when deployed
