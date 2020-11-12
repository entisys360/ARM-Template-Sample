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
}

# Create ansible dir and clone github repo in newly created dir
clone_ansible_repo_func() {
  sudo mkdir /opt/ansible
  sudo chown -R :adm /opt/ansible/
  sudo git clone https://github.com/entisys360/Desktop360-mgsv-ansible.git /opt/ansible
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
      log_func "[INFO]: epel-release and selected packages successfully installed."
    else
      log_func "[ERROR]: $?"
    fi

  clone_ansible_repo_func
  if [ "$?" == 0 ]; then 
    log_func "[INFO]: Git repository successfully cloned to /opt/ansible"
  else
    log_func "[ERROR]: $?"
  fi

  ansible_execute_func
  touch /tmp/machine_catalog.json
  touch /tmp/hosting_connection.json
  echo "$1" > /tmp/machine_catalog.json
  echo "$2" > /tmp/hosting_connection.json
}

main "$@"

