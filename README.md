**TL;DR:**

To develop Review Board inside a VM, [make sure you have Vagrant installed](http://www.vagrantup.com/), and then do following:

    git clone https://github.com/smacleod/rb-vm-dev.git # Clone this repo, of course
    cd rb-vm-dev
    git clone https://github.com/reviewboard/reviewboard.git src/reviewboard
    git clone https://github.com/djblets/djblets.git src/djblets
    vagrant up --provider vmware_fusion # Takes ~5-45 minutes
    vagrant ssh
    cd /src/djblets && ./setup.py develop release && cd /src/reviewboard && ./setup.py develop
    ./contrib/internal/prepare-dev.py

And you're all set! To run the development server, run this:

    ./contrib/internal/devserver.py

And then point a browser at [http://localhost:8080](http://localhost:8080).

# Review Board VM Based Development

This repository provides configuration for developing Review Board inside a VM
using vagrant. To get started first clone this repository. You should then clone
the repositories needed for review board development into the *src* directory:

    git clone https://github.com/reviewboard/reviewboard.git src/reviewboard
    git clone https://github.com/djblets/djblets.git src/djblets

The *src* directory will be shared inside the vm, and synced with any
modifications made in your host operating system.

To create and start the VM and install the required dependencies run:

    vagrant up --provider vmware_fusion

VMWare Workstation, and VirtualBox are also support with the following commands:

    vagrant up --provider vmware_workstation # For VMWare Workstation
    vagrant up # For VirtualBox

This will create a virtual machine, and provision it with the dependencies
required for developing Review Board. This can take anywhere from five minutes
to an hour, and will vary greatly depending on your connection speed.

Now you will ssh into the VM with the following command:

    vagrant ssh

The *src* directory on your host machine will be shared to */src* inside the VM.
We will now setup the code you cloned previously for development with the
following command (Make sure you are ssh'd into the VM before running these):

    cd /src/djblets && ./setup.py develop release && cd /src/reviewboard && ./setup.py develop

The final step to make your environment ready for development is to run:

    cd /src/reviewboard
    ./contrib/internal/prepare-dev.py

# Developing

Now that the environment has been created, you can run the development server
by executing the following commands:

    vagrant ssh # SSH into the VM
    cd /src/reviewboard
    ./contrib/internal/devserver.py

This will start the development server inside the VM, which can be accessed
by pointing your browser at http://localhost:8080

To run the unit tests, execute the following commands:

    vagrant ssh # SSH into the VM
    cd /src/reviewboard
    ./reviewboard/manage.py test

