A repository for Review Board development using vagrant.

To get started, clone this repository, and then run the following command in
the root directory:

    vagrant up

This will create a virtual machine, and provision it with the dependencies
required for developing Review Board.

Any files placed in the 'src' subdirectory will be shared with the VM, and
can be accessed at '/src/' inside. This is a great place to clone the
Review Board project code for development:

    cd src
    git clone https://github.com/reviewboard/reviewboard.git
    git clone https://github.com/djblets/djblets.git
    git clone https://github.com/reviewboard/rbtools.git

To start developing, ssh into the VM, install the Review Board code, and prepare
the development environment with the following commands:

    vagrant ssh
    cd /src/rbtools
    ./setup.py develop
    cd ../djblets
    ./setup.py develop
    cd ../reviewboard
    ./setup.py develop
    ./contrib/internal/prepare-dev.py

Any changes made to the code in 'src/' will be reflected inside the VM. Use your
favourite editor to make modifications, and test them inside the VM.

The Review Board server can be ran inside the VM using the following commands:

    vagrant ssh
    cd /src/reviewboard
    ./contrib/internal/devserver.py

This will start the Review Board development server inside the VM, which can be
accessed in your web browser at http://localhost:8080
