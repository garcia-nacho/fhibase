FROM debian:bookworm

LABEL maintainer="Nacho Garcia <iggl@fhi.no>"

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# Preserve paths for existing scripts and Conda environments
ENV PATH="/home/docker/miniconda3/envs/pangolin/bin:/home/docker/Scripts:/home/docker/miniconda3/bin:${PATH}"

# Install system dependencies and R
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        bash \
        ed \
        less \
        locales \
        vim-tiny \
        nano \
        wget \
        curl \
        ca-certificates \
        fonts-texgyre \
        liblzma-dev \
        libcurl4-openssl-dev \
        libxml2-dev \
        libgc-dev \
        libssl-dev \
        libpoppler-cpp-dev \
        libopenblas0-pthread \
        build-essential \
        gcc \
        g++ \
        make \
        procps \
        git \
        bc \
        rsync \
        nodejs \
        npm \
        python3 \
        python3-pip \
        python3-venv \
        r-base \
        r-base-dev \
        r-base-core \
        r-recommended \
        littler \
        r-cran-littler \
        r-cran-docopt \
    && rm -rf /var/lib/apt/lists/*

# Configure locale
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8

# Expose the standard littler helper scripts
RUN for script in \
        install.r \
        install2.r \
        installBioc.r \
        installDeps.r \
        installGithub.r \
        testInstalled.r; do \
        target="/usr/lib/R/site-library/littler/examples/$script"; \
        if [ -f "$target" ]; then \
            ln -sf "$target" "/usr/local/bin/$script"; \
        fi; \
    done

# Create the default user
ARG USER=docker
ARG GROUP=docker

RUN groupadd -f "${GROUP}" && \
    useradd -m -s /bin/bash -g "${GROUP}" "${USER}" && \
    mkdir -p /home/docker/Scripts

ENV HOME="/home/${USER}"

WORKDIR /home/docker

CMD ["/bin/bash"]

