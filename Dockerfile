FROM debian:bullseye-slim
LABEL maintainer="anuj.rohatgi@procore.com"

USER root

# Update OS
RUN apt-get update && \
    echo 'y' | apt install sudo && \
    echo 'y' | apt-get install vim && \
    echo 'y' | apt-get install wget && \
    echo 'y' | apt-get install unzip && \
    echo 'y' | apt-get install jq && \
    echo 'y' | apt install ruby && \
    gem install terraform_landscape && \
    echo 'y' | apt install git && \
    echo 'y' | apt install openssh

# Configuration Variables
ENV TFCLI_INSTALL /opt/tfcli/tfcli-bundle/install
ENV TFCLI_HOME /opt/tfcli

# Create Directories
RUN mkdir -p /opt/tfcli/mount && \
    mkdir -p /opt/tfcli/bin && \
    mkdir -p /opt/tfcli/tfcli-bundle/install


# Create TFCLI user & group
RUN groupadd -r terraform && \
    useradd -d /opt/tfcli -r -g terraform tfcli && \
    usermod -aG sudo tfcli && \
    (echo 'tfcli'; echo 'tfcli') | passwd tfcli


# Copy Scripts
COPY install_terraform ${TFCLI_HOME}/bin/
COPY ReadMe.md ${TFCLI_HOME}/
RUN chmod +x "${TFCLI_HOME}"/bin/install_terraform

# Set permissions
RUN chown -R tfcli:terraform "${TFCLI_HOME}"

# Download and install Terraform CLI build files
USER tfcli
RUN ${TFCLI_HOME}/bin/install_terraform
RUN rm ${TFCLI_HOME}/.wget-hsts

RUN chmod +x "${TFCLI_HOME}"/bin/*
ENV PATH="${TFCLI_HOME}/bin:${PATH}"
RUN echo 'alias terraform="tf12"' > ~/.bashrc

WORKDIR /opt/tfcli
VOLUME ["/opt/tfcli/mount"]

ENTRYPOINT ["/bin/bash"]
CMD []
