###############################################
# Two-stage Nginx container.
###############################################

# Build stage
FROM alpine:20260805 AS build-stage

# 9/7/2026 Should WORKDIR be changed to something else? (Default is "/")
COPY ./tools/BuildNginx.sh /tmp/
RUN sh /tmp/BuildNginx.sh

# Runtime stage
FROM alpine:20260805 AS runtime-stage
WORKDIR /nginx
COPY --from=build-stage /nginx/objs/nginx /nginx/sbin/nginx
COPY ./tools/InstallNginxRuntimeDependencies.sh /tmp/
RUN sh /tmp/InstallNginxRuntimeDependencies.sh
COPY ./tools/SetupNginxUserAndLogs.sh /tmp/
RUN sh /tmp/SetupNginxUserAndLogs.sh
EXPOSE 80
STOPSIGNAL SIGQUIT
CMD ["/nginx/sbin/nginx", "-g", "daemon off;"]