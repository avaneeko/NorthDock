###############################################
# Two-stage MariaDB container.
###############################################

# Build stage
FROM alpine:20260805 AS build-stage

WORKDIR /build
COPY ./tools/BuildMariaDB.sh /tmp/
RUN ash /tmp/BuildMariaDB.sh

# Runtime stage
FROM alpine:20260805 AS runtime-stage
WORKDIR /mariadb
# Important: ./ is mandatory as the destination, because `COPY` copies contents of the folder,
# not the folder itself.
COPY --from=build-stage /mariadb ./
COPY ./tools/InstallMariaDBRuntimeDependencies.sh /tmp/
RUN ash /tmp/InstallMariaDBRuntimeDependencies.sh
# Create data directory for MariaDB. Otherwise it's startup will fail with errcode 2.
# 9/8/2026 This might not be necessary since mariadb-install-db should take care of this.
RUN mkdir /mariadb_data/
# Creates system tables for MariaDB. Database will fail to start if there are no system tables.
# 9/8/2026 Create a dedicated mariadb account with appropriate permissions.
# 9/8/2026 Decide which port to use for MariaDB.
EXPOSE 3306
# 9/8/2026 Create a dedicated mariadb account with appropriate permissions.
COPY ./tools/Entry.sh /

CMD ["/bin/ash", "-c", "/Entry.sh"]