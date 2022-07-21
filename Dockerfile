FROM melantrance/full-ubuntu:jupyter
VOLUME [ "/var/run/docker.sock:/var/run/docker.sock" ]

RUN apt-get update
RUN apt install ssh wget npm apache2 php php-curl php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring  php-xml php-pear php-bcmath  -y
RUN  npm install -g wstunnel
RUN mkdir /run/sshd 
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_wstunnel
RUN a2enmod  rewrite
RUN wget https://github.com/MelanTranceYT/berbagicarasetting3/blob/main/000-default.conf
RUN rm /etc/apache2/sites-available/000-default.conf
RUN mv 000-default.conf /etc/apache2/sites-available
RUN echo 'You can play the awesome Cloud NOW! - Message from berbagi cara setting!' >/var/www/html/index.html
RUN echo 'wstunnel -s 0.0.0.0:8989 & ' >>/luo.sh
RUN echo 'wget https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz && tar -xvf gotty_linux_amd64.tar.gz && ./gotty -p 8080 -w bash' >>/luo.sh
RUN echo 'service mysql restart' >>/luo.sh
RUN echo 'service apache2 restart' >>/luo.sh
RUN echo '/usr/sbin/sshd -D' >>/luo.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN cd /root && wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz && tar -xvf ngrok-v3-stable-linux-amd64.tgz && ./ngrok config add-authtoken 2BQYi6cURSKLvUSARB5AOnOLMxP_6F73faQkGCc6uNgJqq5CP
RUN echo root:123456|chpasswd
RUN chmod 755 /luo.sh
EXPOSE 80
EXPOSE 443
EXPOSE 22
EXPOSE 3306
CMD  /luo.sh

