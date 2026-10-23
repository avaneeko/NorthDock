###############################################
# Two-stage Nginx container.
###############################################

# Build stage
FROM alpine:20260805 AS build-stage

WORKDIR /build
COPY ./tools/BuildNginx.sh /tmp/
RUN sh /tmp/BuildNginx.sh

# Runtime stage
FROM alpine:20260805 AS runtime-stage
WORKDIR /nginx
# Important: ./ is mandatory as the destination, because `COPY` copies contents of the folder,
# not the folder itself.
COPY --from=build-stage /nginx ./
COPY ./tools/InstallNginxRuntimeDependencies.sh /tmp/
RUN sh /tmp/InstallNginxRuntimeDependencies.sh
COPY ./tools/SetupNginxUserAndLogs.sh /tmp/
RUN sh /tmp/SetupNginxUserAndLogs.sh
COPY ./conf/nginx.conf /nginx/conf/nginx.conf
EXPOSE 443
STOPSIGNAL SIGQUIT
CMD ["/nginx/sbin/nginx", "-c", "/nginx/conf/nginx.conf", "-g", "daemon off;"]