#!/bin/bash

echo "building docs"
sudo apt-get install doxygen make
sudo pip install breathe sphinx

cd ${ZEPHYRREPO_STATE}
source zephyr-env.sh
cd doc
make htmldocs
