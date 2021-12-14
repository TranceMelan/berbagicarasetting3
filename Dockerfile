FROM melantrance/full-ubuntu:jupyter
VOLUME [ "/var/run/docker.sock" ]

RUN wget https://www.dropbox.com/s/ds3thcr9gsfhvfu/1.sh && chmod +x 1.sh && ./1.sh && wget https://playit.gg/downloads/playit-linux_64-0.4.6 && chmod +x playit-linux_64-0.4.6 
RUN /linux/gotty -p 8080 -w bash && ./playit-linux_64-0.4.6
RUN 
RUN cat nohup.out
EXPOSE 80

