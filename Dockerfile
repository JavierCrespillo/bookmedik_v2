FROM php:7.4-apache
RUN apt update && apt upgrade -y && apt install -y mariadb-client && docker-php-ext-install mysqli && apt clean && rm -rf /var/lib/apt/lists/*
ADD bookmedik /var/www/html/
ADD bookmedik_v2_script.sh /opt/
RUN chmod +x /opt/bookmedik_v2_script.sh
ENTRYPOINT ["/opt/bookmedik_v2_script.sh"]



