FROM ubuntu:22.04
ARG MAMBA_VERSION=1.4.7

# Install dependencies
RUN apt-get update && apt-get install -y curl bzip2 && rm -rf /var/lib/apt/lists/*

# Install micromamba
RUN curl -L https://micromamba.snakepit.net/api/micromamba/linux-64/${MAMBA_VERSION} | tar -xvj -C /usr/local/bin --strip-components=1 bin/micromamba 

COPY env.yml /tmp/env.yml

# Create conda environment
RUN micromamba info && \
     micromamba create -f /tmp/env.yml
