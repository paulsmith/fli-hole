FROM pihole/pihole:latest

COPY ./workaround-start.sh /start.sh

ENV INTERFACE eth0
ENV DNSMASQ_LISTENING ALL
ENV TZ America/Chicago
ENV VIRTUAL_HOST pi.hole
ENV PROXY_LOCATION pi.hole
ENV DNSMASQ_USER root
