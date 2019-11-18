# SRE Tooling - AWSCLI

SRE specific AWSCLI client with OKTA integration and common tasks

## Getting Started

### Docker Image
The required docker image is available from Procore Quay repository at
```
docker pull quay.io/huskyprocore/sre-tooling-awscli
```
**NOTE**

The image will be pulled during the installation process but the above command should be used to update.

### Prerequisites

Docker Desktop
```
  https://www.docker.com/products/docker-desktop
```


OKTA Procore Account with MFA options setup
* Go to OKTA homepage
```
   https://procore.okta.com/app/UserHome
```
* Click on Username Drop Down -> Settings
* Click on Edit button -> Extra Verification
* Add MFA options
  - Currently Yubi Keys (U2F)is supported if your Docker setup **has access to Host USB devices only**

### Installing

Installation requires setting up PATH environment variables and creating a SRE Tooling binary location

#### Windows
TBD

#### Mac OSX

##### Oh My Zsh
```
source <(curl -s https://raw.githubusercontent.com/HuskyProcore/sre-tooling-awscli/master/install-ohmyzsh.sh)
```

##### Bash
```
source <(curl -s https://raw.githubusercontent.com/HuskyProcore/sre-tooling-awscli/master/install-bash.sh)
```

Verify the newly created variables exist and are filled in correctly.


#### Testing Installation
Verify the environment Variables
```
printenv
```

Type the following command to launch an awscli container
```
 aws
```
Type `exit` to quit the container


## Usage
The container can be started using the `aws <profile>` shell script which will do the following

* Sets the `SOURCE_PROFILE` environment variable to the **_profile_ you passed in**
  - Look at AWSCLI Profiles section for more info

* Mounts the following volumes to the host system
  - $DOCKER_VOLUMES/pc-awscli/volumes/.aws
  - $DOCKER_VOLUMES/pc-awscli/volumes/okta

* Sets the container to be removed after execution with `--rm` docker run option
* Sets the container **_name_** to be `pc-awscli-<profile>`
* Sets the container **_hostname_** to be the **_profile_** value


### Starting Without a Profile
Type the following command to launch an awscli container **without a profile**
```
 aws
```

Run the following command to initialize
```
set_username <okta username>
source set_profile <profile>
```
Type `exit` to quit the container

### Starting With a Profile
Type the following command to launch an awscli container **with a profile**
```
 aws <profile>
```
Type `exit` to quit the container

### AWSCLI Profiles
There are **_two_** profiles to manage between OKTA and AWSCLI.
* $DOCKER_VOLUMES/pc-awscli/volumes/.aws/config
* $DOCKER_VOLUMES/pc-awscli/volumes/okta/.okta-aws

Your `.okta-aws` file helps manage which OKTA server to connect and which AWS Profile to use for login

Your `.aws/config` file helps manage which AWSCLI **region** or other AWSCLI specific configurations you may want

**NOTE**

The profile names aren't an exact match between them. In the `.aws/config` you will need to add `[profile <name>]` vs `[<name>]` in the `.okta-aws` file

When the docker container mounts, it will leverage these configuration files and also create a `.aws/credentials` file as you use your OKTA login to each profiles

If you choose to run the docker container with **no mounted volumes**, default files are provided in the container.

## Testing the AWSCLI container

Type the following command to launch an awscli container
```
 aws
```
Type `exit` to quit the container

## Configuration Scripts

### Setting Okta Username
Setting username on default template `.okta-aws` file
```
  set_username <your OKTA username>
```

### Setting Profile or Updating Profile Credentials
Setting profile / re-login to OKTA to update credentials
```
  source set_profile <profile>
```
## Refreshing OKTA Tokens
OKTA credentials will expire over time and can be refreshed by running the following command. It will use the `$SOURCE_PROFILE` value.
```
  refresh
```


Default profile combinations are located here:
  - https://github.com/HuskyProcore/sre-tooling-awscli/blob/master/okta/.okta-aws
  - Additional profiles can be added manually once the tool is installed by modifying the configuration files

## Running Container Without Existing Configuration
The container can be run without the `aws` shell script which will do the following
* Hostname is random
* Container name is random
* **Must run the the commands in the following order**
  - `set_username <okta username>`
  - `source set_profile <profile>`


Running a container
  ```
  docker run -it --rm quay.io/huskyprocore/sre-tooling-awscli
  ```

**NOTE**

Container is temporary so all credentials or configurations disappear afterwards. Container will use default values for **aws region** config and **OKTA access**

## Built With

* [okta-awscli](https://github.com/jmhale/okta-awscli) - Python OKTA integration with awscli
* [AWSCLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) - Amazon AWSCLI User Guide


## Contributing

Please read [CONTRIBUTING.md](https://github.com/HuskyProcore/sre-tooling-awscli) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

## Authors

* **Anuj Rohatgi** - *Initial work*

See also the list of [contributors](https://github.com/HuskyProcore/sre-tooling-awscli/contributors) who participated in this project.

## License

## Acknowledgments
