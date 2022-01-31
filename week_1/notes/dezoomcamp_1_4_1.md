# Setting up VM on GCP
1) Menu -> Compute -> Compute Engine
    if not enabled already, enable the engine
2) create ssh key in ~/.ssh
    In terminal, type: ssh-keygen -t rsa -f [filename] -C [username] -b 2048
3) add ssh key to GCP
    metadata -> SSH keys -> add SSH key
    open the public SSH key file, then copy and past into GCP
4) create a VM instance
    Menu -> Virtual machines -> VM instances
    Set name and region
    Change machine type as needed to more cores or more memory
    Boot Disk: Change to different operating system if desired
        We used Ubuntu -> Ubuntu 20.04 LTS
        Set boot disk size to 30gb so we can dl files and such
5) SSH into instance
    In terminal: ssh -i ~/.ssh/{private_ssh_key_filename} rancher@{GCP_VM_instance_external_ip}
6) Create alias to make SSH faster:
    Create config file in ~/.ssh:
        Host de-zoomcamp
            HostName 34.105.5.47
            User rancher
            IdentityFile ~/.ssh/gcp_ssh_key
    To alias in terminal: ssh de-zoomcamp
# Configure VM instance
0) SSH into VM
    use alias in terminal: ssh de-zoomcamp
1) download anaconda to VM
    In terminal: wget https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh
    Say yes to initalize anaconda at end of installer
2) install anaconda to VM
    In terminal: `bash Anaconda3-2021.11-Linux-x86_64.sh`
3) install docker
    - In terminal: 
        - To update package list: `sudo apt-get update`
        - To install docker: `sudo apt-get install docker.io`
    - Try running in terminal: `docker run hello-world`
    - If it complains about permissions, you need to run the following in terminal:
        - `sudo groupadd docker`
        - `sudo gpasswd -a $USER docker`
        - `sudo service docker restart`
    - exit out of VM and SSH back in
    - To test, type in terminal
        - `docker run hello-world`
4) install docker-compose
    - download correct release for the OS we set up on our VM, in this case linux-x86_64
    - in terminal:
        - `mkdir ~/bin`
        - `cd ~/bin`
        - `wget https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -O docker-compose -O docker-compose`
            - the -O flag specifies output name
        - chmod +x docker-compose
            - this makes the file executable
5) update .bashrc file
    - in terminal:
        - `nano .bashrc`
    - go to end of file and add the following:
        - export PATH=`"${HOME}/bin:${PATH}"`
        - CTRL + O to save, hit yes to confirm
        - CTRL + X to exit

6) Start docker container with postgres/pgAdmin
    - navigate to ~/data-engineering-zoomcamp/week_1_basics_n_setup/2_docker_sql
    - in terminal: `docker-compose up -d`
7) install pgcli using anaconda:
    - `conda install -c conda-forge pgcli`
    - `pip install -U mycli`
8) open pgcli to access PSQL database:
    - `pgcli -h localhost -U root -d ny_taxi`
9) set up port forwarding in VS code
    - you need to be in VS Code connected to SSH by clicking the little green button in lower left corner
    - You need to open up terminal then click ports
        - alternatively, you could hit CTRL + `
    - add port 5432 for postgrest
    - add port 8080 for pgadmin
    - add port 8888 for jupyter note book
        - you can check what port is being used by doing `docker ps` after doing `docker-compose up -d`
10) now you can access SQL db on VM through your local host, without having to SSH in first
    - pgcli -h localhost -U root -d ny_taxi
11) Or you can open jupyter notebook files on the VM through your local host.
    - in a browser: localhost:8888
12) install terraform
    - https://www.terraform.io/downloads
    - We want the Linux binary since the VM was set up on linux
        - https://releases.hashicorp.com/terraform/1.1.4/terraform_1.1.4_linux_amd64.zip
    - need to unzip the download
        - `sudo apt-get install unzip`
            - this installs the unzip package
        - `unzip terraform_1.1.4_linux_amd64.zip`
    - rm the zip file after unzipping binary file
    - we need to upload our JSON file that has the GCP credentials in it
        - `sftp de-zoomcamp`
        - `mkdir ~/.gc`
        - `cd ~/.gc`
        - `put google_credentials.json`
    - set up environmental variable pointing to credentials
        - `export GOOGLE_APPLICATION_CREDENTIALS=~/.gc/google_credentials.json`
    - activate credentials
        - `gcloud auth activate-service-account --key-file $GOOGLE_APPLICATION_CREDENTIALS`
    - navigate to terraform folder that has main.tf and variables.tf then do:
        - `terraform init`
        - `terraform plan`
            - project name: de-zoomcamp-944
13) shut down VM: `sudo shutdown now`
14) to restart VM, you can go into GCP and turn the VM back on, but it will have a new external ip
    - In order to be able to SSH back in:
        - edit alias for SSH on local machine:
            - `nano .ssh/config`
            - change ip address to new external_ip
    - Now you can connect using `ssh de-zoomcamp` alias