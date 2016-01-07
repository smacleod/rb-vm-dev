To develop Review Board inside a VM,
[make sure you have Vagrant installed](http://www.vagrantup.com/), and then do
following:

    git clone https://github.com/smacleod/rb-vm-dev.git # Clone this repo, of course
    vagrant up

This will create a virtual machine, and provision it with the dependencies
required for developing Review Board. This could be very fast, or take quite
a while depending on your connection speed

To run the development server, execute the following commands:

    vagrant ssh # SSH into the VM
    source /src/venv/bin/activate
    cd /src/reviewboard
    ./contrib/internal/devserver.py

And then point a browser at [http://localhost:8080](http://localhost:8080).

The *src* directory will be shared inside the vm, and synced with any
modifications made in your host operating system. By default all code needed
for development will be automatically cloned to this directory.

To run the unit tests, execute the following commands:

    vagrant ssh # SSH into the VM
    source /src/venv/bin/activate
    cd /src/reviewboard
    ./reviewboard/manage.py test
