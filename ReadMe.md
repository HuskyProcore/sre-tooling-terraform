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
```
printenv
```

#### Testing Installation

Type the following command to launch an tfcli container
```
 tf
```
Type `exit` to quit the container


## Usage
The container can be started using the `tf` shell script which will do the following


* Sets the container to be removed after execution with `--rm` docker run option
* Sets the container **_name_** to be `pc-tfcli`
* Sets the container **_hostname_** to be `terraform`
* Sets the `terraform` command to **terraform 12 binary**

Other terraform binaries are also available under `/opt/tfcli/bin` and can be used by
   - `tf<major version>` example `tf11`
   

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
