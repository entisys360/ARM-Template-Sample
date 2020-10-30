#! /usr/bin/env bash
# 
# Install Ansible and execute setup.yml
# dave.ruffin@entisys360.com (2020.10.13)

LOGFILE="/var/log/ansible.log"

# Add epel repo and packages
add_packages_func() {
  sudo dnf makecache
  sudo dnf update && sudo dnf upgrade -y
  sudo dnf install epel-release -y
  sudo dnf install -y \
    git \
    ansible
    mkdir /opt/{terraform_0.13.5,packer_1.6.4}
    cd /opt/terraform_0.13.5 && curl -O https://releases.hashicorp.com/terraform/0.13.5/terraform_0.13.5_linux_amd64.zip
    cd /opt/packer_1.6.4 && curl -O https://releases.hashicorp.com/packer/1.6.4/packer_1.6.4_linux_amd64.zip
    cd /opt/terraform_0.13.5 && unzip terraform_0.13.5_linux_amd64.zip && sudo ln -s ~/terraform_0.13.5/terraform /usr/bin/terraform
    cd /opt/packer_1.6.4 && unzip packer_1.6.4_linux_amd64.zip && sudo ln -s ~/packer_1.6.4/packer /usr/bin/packer
}

# Create ansible dir and clone github repo in newly created dir
clone_ansible_repo_func() {
  sudo mkdir /opt/ansible
  sudo chown -R :adm /opt/ansible/
  sudo git clone https://github.com/entisys360/mvp-ansible.git /opt/ansible
  sudo chown -R :adm /opt/ansible/
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
  add_epel_repo_func
    if [ "$?" == 0 ]; then 
      log_func "[INFO]: epel-release, ansible, and git successfully installed."
    else
      log_func "[ERROR]: $?"
    fi

  clone_ansible_repo_func
  if [ "$?" == 0 ]; then 
    log_func "[INFO]: https://github.com/entisys360/mvp-ansible.git github repo successfully cloned to /opt/ansible"
  else
    log_func "[ERROR]: $?"
  fi

  ansible_execute_func
  touch /tmp/ansible_hosting_var.json
  echo "$1" > /tmp/ansible_hosting_var.json
}

main "$@"

