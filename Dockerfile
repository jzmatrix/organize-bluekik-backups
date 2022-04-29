FROM jzmatrix/debian-baseimage
################################################################################
RUN apt update && \
    apt -y install libyaml-tiny-perl liblwp-protocol-https-perl libjson-perl libdbd-mysql-perl libdbi-perl libcryptx-perl libmime-lite-html-perl libmime-tools-perl libmail-imapclient-perl libdate-calc-perl curl libdbd-sqlite3-perl

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
ADD config/startServices.sh /opt/startServices.sh
################################################################################
RUN chmod 755 /opt/startServices.sh
################################################################################
ADD scripts /opt/organizeKik/
RUN chmod 755 -R /opt/organizeKik/
################################################################################
# CMD ["/opt/organizeKik/organizeFiles"]   # Used when deployed
CMD [ "/opt/startServices.sh" ] # Only used for dev and testing
