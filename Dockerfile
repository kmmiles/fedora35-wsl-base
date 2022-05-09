FROM fedora:35
ENV WSL_DISTRO_NAME fedora35-base

# bootstrap
COPY ./scripts/provision/bootstrap /provision/scripts/bootstrap
RUN ./provision/scripts/bootstrap

# copy scripts
COPY ./scripts/wsl-on-boot \
     ./scripts/wsl-sync-home \
     ./scripts/wsl-home-links \ 
     /usr/local/bin/

# handle shrinking image
ARG SHRINK
COPY ./scripts/provision/shrink /provision/scripts/shrink
RUN /provision/scripts/shrink
