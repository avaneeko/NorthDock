###############################################
# Nginx runtime user, log setup and the SSL key.
###############################################

addgroup -S nginx && adduser -S -D -H -G nginx nginx
mkdir -p /nginx/logs /var/cache/nginx
chown -R nginx:nginx /nginx/logs /var/cache/nginx
ln -sf /dev/stdout /nginx/logs/access.log
ln -sf /dev/stderr /nginx/logs/error.log

openssl req -x509 -nodes \
    -out /nginx/northdock.crt \
    -keyout /nginx/northdock.key \
    -subj "/C=FI/ST=Uusimaa/L=Helsinki/O=42.fr/OU=NorthDock/CN=losypenk.42.fr"