# Install of AWSCLI for Oh My #!/usr/bin/env zsh

# Pull docker image
docker pull quay.io/huskyprocore/sre-tooling-tfcli

# Create a docker directory for use by attached volumes used by containers
cd ~
mkdir -p docker/pc-tfcli/volumes
curl -o docker/pc-tfcli/tf.sh https://raw.githubusercontent.com/HuskyProcore/sre-tooling-tfcli/master/pc-tfcli/tf.sh
cd docker

# Add the newly created directory to your environment variables
if [[ -z $SRE_TOOLING ]]; then
  export SRE_TOOLING=~/sre-tooling
  echo export SRE_TOOLING=~/sre-tooling >> ~/.zshrc
  echo PATH=$PATH:$SRE_TOOLING/bin >> ~/.zshrc
fi

if [[ -z $DOCKER_VOLUMES ]]; then
  export DOCKER_VOLUMES=$(pwd)
  echo export DOCKER_VOLUMES=$(pwd) >> ~/.zshrc
fi

# Create a directory for SRE binaries
cd ~
mkdir -p sre-tooling/bin

# Create a Symlink to AWSCLI binls -alias name="#statement"aries from mounted Docker Volumecd $
cd $SRE_TOOLING
ln -s $DOCKER_VOLUMES/pc-tfcli/tf.sh $SRE_TOOLING/bin/tf
chmod +x $SRE_TOOLING/bin/tf
