#! /usr/bin/env bash
# 
# Install Ansible and execute setup.yml
# dave.ruffin@entisys360.com (2020.10.13)

LOGFILE="/var/log/ansible.log"

# Add epel repo and packages
add_packages_func() {
  sudo dnf makecache
  sudo yum install -y epel-release
  sudo yum install -y \
    git \
    ansible
    # mkdir /opt/{terraform_0.13.5,packer_1.6.4}
    # cd /opt/terraform_0.13.5 && curl -O https://releases.hashicorp.com/terraform/0.13.5/terraform_0.13.5_linux_amd64.zip
    # cd /opt/packer_1.6.4 && curl -O https://releases.hashicorp.com/packer/1.6.4/packer_1.6.4_linux_amd64.zip
    # cd /opt/terraform_0.13.5 && unzip terraform_0.13.5_linux_amd64.zip && sudo ln -s ~/terraform_0.13.5/terraform /usr/bin/terraform
    # cd /opt/packer_1.6.4 && unzip packer_1.6.4_linux_amd64.zip && sudo ln -s ~/packer_1.6.4/packer /usr/bin/packer
    sudo pip3 install -r https://raw.githubusercontent.com/ansible-collections/azure/dev/requirements-azure.txt  
    sudo ansible-galaxy collection install azure.azcollection --force
    sudo pip3 install "pywinrm>=0.3.0"
}

# Create ansible dir and clone github repo in newly created dir
clone_ansible_repo_func() {
  sudo curl  https://e360artifacts.blob.core.windows.net/artifacts/citrixxd-ansible.zip --output /root/citrixxd-ansible.zip
  sudo mkdir /opt/ansible
  sudo unzip /root/citrixxd-ansible.zip -d /opt/ansible/
  sudo rm -f /root/citrixxd-ansible.zip
}

# Execute Ansible plays
ansible_execute_func() {
  ansible-playbook /opt/ansible/setup.yml
}

# Echo messages to log file
log_func() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@" | tee -a $LOGFILE
}

# Execute functions
main() {
  add_packages_func
  clone_ansible_repo_func
  sudo touch opt/ansible/citrixxd-ansible/mc.json
  sudo touch opt/ansible/citrixxd-ansible/hc.json
  sudo touch opt/ansible/citrixxd-ansible/dc.json
  sudo echo "$1" > /opt/ansible/citrixxd-ansible/mc.json
  sudo echo "$2" > /opt/ansible/citrixxd-ansible/hc.json
  sudo echo "$3" > /opt/ansible/citrixxd-ansible/dg.json
}

main "$@"

