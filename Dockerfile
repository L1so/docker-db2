FROM ibmcom/db2

RUN mkdir /var/custom
COPY custom-scripts/init.sql /var/tmp
COPY custom-scripts/init.sh /var/custom
RUN chmod +x /var/custom/init.sh
