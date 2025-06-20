FROM dorowu/ubuntu-desktop-lxde-vnc

USER root

RUN apt-get update && \
    apt-get install -y firefox xfce4 xfce4-goodies x11vnc && \
    apt-get clean

COPY xstartup /root/.vnc/xstartup
RUN chmod +x /root/.vnc/xstartup

CMD ["/startup.sh"]