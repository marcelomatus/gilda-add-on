#-------------------------
# Gilda-addon Docker
#-------------------------

#
# To build
#   docker build --no-cache -t local/gilda-local-addon .
#
# To  run
#   docker run --name gilda-local -p 5024:5024 --rm  -it local/gilda-local-addon
#
# To test
#   curl -s -X POST -H "Content-Type: application/json" -d @system.json  http://127.0.0.1:5024/optimize
#
# where the system.json is a JSON input file system descriptor.
#

#---------------------------------------
# Setting the base image and build arch
#---------------------------------------

# ARG os_version=ubuntu
# ARG os_minor=20.04
ARG os_version=debian
ARG os_minor=bookworm

ARG BUILD_ARCH=amd64

FROM ghcr.io/home-assistant/$BUILD_ARCH-base-$os_version:$os_minor AS base

#---------------------------------
# Copying gilda-local requirements and more
#---------------------------------


WORKDIR /app
COPY requirements.txt /app/

#-------------------------
# apt & pip package install
#-------------------------

# debian requires --break-system-packages
ARG pip_args=--break-system-packages  --no-cache-dir  --force-reinstall

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    git gcc make cmake libssl-dev \
    libmariadb3 \
    libmariadb-dev \
    python3 \
    python3-dev \
    python3-pip \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ARG CACHEBUST=3
RUN echo "$CACHEBUST"
# disable the cache if there is a new commit
ADD "https://api.github.com/repos/marcelomatus/gilda-add-on/commits?per_page=1" latest_commit
ADD "https://api.github.com/repos/marcelomatus/gilda-local/commits?per_page=1" latest_commit

RUN pip3 install $pip_args --upgrade  pip && \
    pip3 install $pip_args -r requirements.txt


#-------------------------
# GILDA-LOCAL addon
#-------------------------

FROM base AS addon

LABEL \
    io.hass.name="gilda-local" \
    io.hass.description="GILDA-LOCAL: Energy Management System" \
    io.hass.version="1.2" \
    io.hass.type="addon" \
    io.hass.arch="aarch64|amd64|armhf|armv7"

ENTRYPOINT [ "python3", "-m", "gilda_local.web_server"]

#-------------------------
# Closing the Docker
#-------------------------

FROM addon AS final
