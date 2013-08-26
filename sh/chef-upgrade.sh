#!/bin/bash

CHEF_INSTALLER_URL="https://www.opscode.com/chef/install.sh"

echo "Attempting to upgrade Chef"

if [ -e "chef-upgraded" ] ; then
    echo "Chef already upgraded"
else
    if [ ! -e "chef-install.sh" ] ; then
        echo "Downloading Chef installer"
        wget --quiet -O chef-install.sh ${CHEF_INSTALLER_URL}
        chmod +x chef-install.sh
    fi
    echo "Running Chef install"
    ./chef-install.sh
    touch chef-upgraded
fi
