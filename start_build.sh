#!/bin/bash
INPUT_PATH="./"
BUILD_PATH=${INPUT_PATH}
BUILD_VARS="${INPUT_PATH}/linux-ubuntu-24-04-lts.pkrvars.hcl"
CONFIG_PATH=./config

### Build a Ubuntu Server 24.04 LTS Template for Proxmox. ###
echo "Building a Ubuntu Server 24.04 LTS Template for Proxmox..."

### Initialize HashiCorp Packer and required plugins. ###
echo "Initializing HashiCorp Packer and required plugins..."
packer init "$INPUT_PATH"

### Start the Build. ###
echo "Starting the build...."
echo "packer build -force -on-error=ask $debug_option"
packer build -force -on-error=ask $debug_option \
    -var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
    -var-file="$CONFIG_PATH/build.pkrvars.hcl" \
    -var-file="$CONFIG_PATH/common.pkrvars.hcl" \
    -var-file="$CONFIG_PATH/linux-storage.pkrvars.hcl" \
    -var-file="$CONFIG_PATH/network.pkrvars.hcl" \
    -var-file="$CONFIG_PATH/proxmox.pkrvars.hcl" \
    -var-file="$CONFIG_PATH/$BUILD_VARS" \
    "$INPUT_PATH"

### All done. ###
echo "Done."
