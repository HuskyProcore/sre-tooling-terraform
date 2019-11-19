# SRE Tooling - TFCLI

SRE specific TFCLI client with OKTA integration and common tasks

## Getting Started

### Docker Image
The required docker image is available from Procore Quay repository at
```
docker pull quay.io/huskyprocore/sre-tooling-tfcli
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
source <(curl -s https://raw.githubusercontent.com/HuskyProcore/sre-tooling-tfcli/master/install-ohmyzsh.sh)
```

##### Bash
```
source <(curl -s https://raw.githubusercontent.com/HuskyProcore/sre-tooling-tfcli/master/install-bash.sh)
```

Verify the newly created variables exist and are filled in correctly.


#### Testing Installation
Verify the environment Variables
```
printenv
```

Type the following command to launch an tfcli container
```
 tf
```
Type `exit` to quit the container


## Usage
The container can be started using the `tf` shell script which will do the following


* Sets the container to be removed after execution with `--rm` docker run option
* Sets the container **_name_** to be `pc-tfcli`


Type the following command to launch an tfcli container
```
 tf
```
Type `exit` to quit the container

## Configuration Scripts

### Installing Terraform versions
Setting username on default template `.okta-tf` file
```
  set_username <your OKTA username>
```

## Built With

* [Terraform](https://https://www.terraform.io/) - Terraform

## Contributing

Please read [CONTRIBUTING.md](https://github.com/HuskyProcore/sre-tooling-tfcli) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

## Authors

* **Anuj Rohatgi** - *Initial work*

See also the list of [contributors](https://github.com/HuskyProcore/sre-tooling-tfcli/contributors) who participated in this project.

## License

## Acknowledgments
