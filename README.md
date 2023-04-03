# Docker template for Ubuntu
Template for generating ubuntu docker with a run script that allows running with same user credentials inside the docker.  
The build and run scripts source the common `names.sh` to allow sharing parameters between scripts.  
Currently, the only variable declared there is DOCKER_NAME=ubuntu_docker. Feel free to change...

# Build the docker with:  
`./build.sh`

# Run the docker with:  
`./run.sh`  

For your convenience, the .bashrc is copied from the host into the Docker.  
It allows you to feel at home (in case you have all sorts of aliases declared there).  
In addition, your host home directory is mapped to ~/hosthome inside your Docker.  
It is not set to your ~/ for a reason.  
If you do that your setting changes inside docker (e.g. setting gitconfig) will affect your host machine.

