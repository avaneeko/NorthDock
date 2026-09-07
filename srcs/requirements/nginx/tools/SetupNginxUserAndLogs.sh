###############################################
# Nginx runtime user and log setup.
###############################################

addgroup -S nginx && adduser -S -D -H -G nginx nginx
mkdir -p /nginx/logs /var/cache/nginx
chown -R nginx:nginx /nginx/logs /var/cache/nginx
ln -sf /dev/stdout /nginx/logs/access.log
ln -sf /dev/stderr /nginx/logs/error.log