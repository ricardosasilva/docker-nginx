FROM dockerfile/confd

RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq

# Install Nginx
RUN add-apt-repository -y ppa:nginx/stable
RUN \
  DEBIAN_FRONTEND=noninteractive apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y -qq nginx

ADD supervisor/conf.d/ /etc/supervisor/conf.d/
ADD nginx/ /etc/nginx/

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled",]

# Expose ports.
EXPOSE 80
EXPOSE 443
