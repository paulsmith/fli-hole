FROM alpine:latest as tailscale
WORKDIR /app
ENV TSFILE=tailscale_1.24.2_amd64.tgz
RUN wget https://pkgs.tailscale.com/stable/${TSFILE} && tar xzf ${TSFILE} --strip-components=1

FROM pihole/pihole:latest

RUN apt-get update && apt-get install -y iptables
RUN update-alternatives --set iptables /usr/sbin/iptables-legacy
RUN update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy

COPY --from=tailscale /app/tailscaled /app/tailscaled
COPY --from=tailscale /app/tailscale /app/tailscale
RUN mkdir -p /var/run/tailscale /var/cache/tailscale /var/lib/tailscale

RUN mkdir -p /etc/services.d/tailscale
COPY ./s6_run_tailscale_once /etc/services.d/tailscale/run

COPY ./workaround-start.sh /start.sh

ENV INTERFACE eth0
ENV DNSMASQ_LISTENING ALL
ENV TZ America/Chicago
ENV VIRTUAL_HOST pi.hole
ENV PROXY_LOCATION pi.hole
ENV DNSMASQ_USER root
