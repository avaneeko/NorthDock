*This project has been created as part of the 42 curriculum by losypenk.*

# Description
This project aims to give an introduction into containerization using Docker.
It aims to explain the specifics of using Docker for software deployment and it's differences
to a Virtual Machine, or not using any container solution at all.
In this project, we're tasked with building a *docker compose* that brings up three different docker
containers that work in unisonance to host a WordPress website.
The three containers being: _MariaDB_ - The backing MySQL-compatible database, _Nginx_ - The
high-performance web-server, WordPress - A widely popular blogging content management system powered
by php-fpm.

# Project description
_Virtual Machines vs Docker_ - Docker is a light-weight containerization solution that runs on
Linux-specific mechanisms while Virtual Machines are full-blown emulators of hardware, either
of same or completely different architecture and OS target. Both have their overlapping and
non-overlapping uses, but generally Docker is a much lighter solution than a Virtual Machine.
_Secrets vs Environment Variables_ - Docker secrets are a Docker-specific feature that takes a
different approach to handling sensitive data like database passwords or ssh keys. While env
variables capability is a UNIX mechanism where processes have a set of environmental variables,
Docker secrets managed by Docker and are mounted into tmpfs for the services that need access to
that secret, that in turn minimizes the attack surface, but most of the security comes first and
foremost from careful software architecture and deployment, not which secret storage you use,
the environmental variables or Docker secrets.
_Docker Network vs Host Network_ - Host Network is a direct network device capability exposed by
your operating system, it's fast and unisolated. It doesn't mean that unsafe, but it lacks virtual
networking. Docker Network is an internal, Docker-managed virtual network that allows extensive
configuration and isolation, but it brings a small penalty when packets pass through it. Whether
the extra functionality is needed at all or is the penalty acceptable depends on the application and
it's use-case and performance targets.
_Docker Volumes vs Bind Mounts_ - Docker volumes are the primary persistent storage types managed by
Docker, they're the efficient default. Bind Mount on the other hand, is a mount point that links
host OS directory with a directory inside the container. It's a highly flexible solution for sharing
and persisting files, but because the mount folder is stored on the host OS filesystem, Docker has
limited optimization and efficiency tricks.

# Instructions
Refer to USER_DOC.md.

# Resources
Docker documentation.
MariaDB documentation.
Nginx documentation.
Ash shell documentation.
AI was used for determining the package differences between Alpine Linux and Debian, as well as
a search tool for documentation. AI was not used for drafting any of the markdown documents nor
any complete solutions for this project.