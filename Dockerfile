# Pull base image.
FROM ubuntu:14.04.5

# Install Nginx.
RUN \
  apt-get -q -y update && \
  apt-get -q -y install build-essential libpcre3 \
  cron logrotate make \
  zlib1g-dev curl pgp yasm \
  libpcre3-dev libssl-dev unzip wget nano 

RUN cd /root && \
  wget http://nginx.org/download/nginx-1.10.1.tar.gz && \
  wget https://github.com/arut/nginx-rtmp-module/archive/master.zip
  
RUN cd /root && \
  tar -zxvf nginx-1.10.1.tar.gz  && \
  unzip master.zip
  
RUN cd /root/nginx-1.10.1 && \
  ./configure --add-module=../nginx-rtmp-module-master && \
  make && \
  make install

ADD nginx.conf /usr/local/nginx/conf/nginx.conf
  
RUN \
  wget https://raw.github.com/chakkritte/nginx-init-ubuntu/master/nginx -O /etc/init.d/nginx && \
  chmod +x /etc/init.d/nginx && \
  update-rc.d -f nginx defaults && \
  echo "\ndaemon off;" >> /usr/local/nginx/conf/nginx.conf

# Expose ports.
EXPOSE 80
EXPOSE 443
EXPOSE 1395

VOLUME ["/usr/local/nginx/html"]
  
# Define working directory.
WORKDIR /usr/local/nginx

# Define default command.
CMD ["/usr/local/nginx/sbin/nginx","-c","/usr/local/nginx/conf/nginx.conf"]
