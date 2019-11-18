FROM debian:bullseye-slim
LABEL maintainer="anuj.rohatgi@procore.com"

#ARGs
ARG VERSION

USER root

# Update OS
RUN apt-get update && \
    echo 'y' | apt install sudo && \
    echo 'y' | apt-get install vim && \
    echo 'y' | apt-get install curl && \
    echo 'y' | apt-get install unzip && \
    echo 'y' | apt-get install jq

# Configuration Variables
ENV TFCLI_INSTALL /opt/tfcli/tfcli-bundle/install
ENV TFCLI_HOME /opt/tfcli
#AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_SESSION_TOKEN


# Create Directories
RUN mkdir -p /opt/tfcli/bin && \
    mkdir -p /opt/tfcli/tfcli-bundle/install


# Create TFCLI user & group
RUN groupadd -r terraform && \
    useradd -d /opt/tfcli -r -g terraform tfcli && \
    usermod -aG sudo tfcli && \
    (echo 'tfcli'; echo 'tfcli') | passwd tfcli


# Copy Scripts
#COPY bin ${TFCLI_HOME}/bin/
COPY ReadMe.md ${TFCLI_HOME}/


# Set permissions
RUN chown -R tfcli:terraform "${TFCLI_HOME}"


# Download and install Terraform CLI build files
USER tfcli
WORKDIR /opt/tfcli/tfcli-bundle/install
ENV VERSION=$VERSION
RUN echo $VERSION
RUN curl "https://releases.hashicorp.com/terraform/$VERSION/terraform_${VERSION}_linux_amd64.zip" -o "tfcli-bundle-$VERSION.zip" && \
    unzip "tfcli-bundle-$VERSION.zip" && \
    mv terraform ${TFCLI_HOME}/bin

RUN chmod +x "${TFCLI_HOME}"/bin/*
ENV PATH="${TFCLI_HOME}/bin:${PATH}"


WORKDIR /opt/tfcli
#VOLUME []

RUN echo 'alias terraform="terraform --profile $SOURCE_PROFILE"' > ~/.bashrc

ENTRYPOINT ["/bin/bash"]
CMD []
