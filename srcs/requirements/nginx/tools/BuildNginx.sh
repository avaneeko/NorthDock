###############################################
# Nginx build script.
###############################################

# Install build dependencies
apk add build-base git pcre2-dev zlib-dev openssl-dev libatomic_ops-dev

# Get source
git clone --recursive https://github.com/nginx/nginx
cd nginx

# Configure build
auto/configure \
    --prefix=/nginx \
    --user=nginx \
    --with-http_ssl_module \
    --with-libatomic \
    --with-threads \
    --with-cc-opt="-O3 -flto -g0 -fstack-check=no -fno-stack-limit -faggressive-loop-optimizations -free" \
    --with-ld-opt="-O3 -flto -g0 -fstack-check=no -fno-stack-limit -faggressive-loop-optimizations -free"

# Build and install
make -j$(expr $(nproc) - 1) && make install