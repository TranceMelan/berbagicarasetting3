FROM melantrance/full-ubuntu:jupyter
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install ssh wget npm apache2 php php-curl php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring  php-xml php-pear php-bcmath  -y
RUN  npm install -g wstunnel
RUN mkdir /run/sshd 
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_wstunnel
RUN a2enmod  rewrite
RUN wget https://raw.githubusercontent.com/jarkomp3/berbagicarasetting3/main/000-default.conf
RUN rm /etc/apache2/sites-available/000-default.conf
RUN mv 000-default.conf /etc/apache2/sites-available
RUN echo 'You can play the awesome Cloud NOW! - Message from berbagi cara setting!' >/var/www/html/index.html
RUN echo 'wstunnel -s 0.0.0.0:8989 & ' >>/luo.sh
RUN echo 'service mysql restart' >>/luo.sh
RUN echo 'service apache2 restart' >>/luo.sh
RUN echo '/usr/sbin/sshd -D' >>/luo.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:123456|chpasswd
RUN chmod 755 /luo.sh
RUN DISPLAY= /opt/google/chrome-remote-desktop/start-host --code="4/0AX4XfWgAzmqvruRD-_PrtHI27E49qvTlnYV2Kvr8mKG7L9Hv-jmgFxTEn4onT1uNH6XnMg" --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --name=$(hostname) --pin=021321 --user-name=melan && service chrome-remote-desktop start
EXPOSE 80
CMD  /luo.sh
