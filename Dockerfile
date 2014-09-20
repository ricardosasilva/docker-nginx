FROM salamandra/confd

# Install Nginx
RUN add-apt-repository -y ppa:nginx/stable
RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qq -y nginx

ADD nginx/ /etc/nginx/
ADD supervisor/conf.d/ /etc/supervisor/conf.d/

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled",]

# Expose ports.
EXPOSE 80
EXPOSE 443
