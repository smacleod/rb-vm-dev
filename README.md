A repository for Review Board development using vagrant.

To get started, clone this repository, and then run the following commands
in the root directory:

    git submodule init
    git submodule update
    vagrant up
    vagrant ssh
    cd /src/djblets
    ./setup.py develop
    cd /src/reviewboard
    ./setup.py develop
    ./contrib/internal/prepare-dev.py
