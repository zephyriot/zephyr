#!/bin/bash

log_file=doc.log

echo "building docs"
sudo apt-get install doxygen make
sudo pip install breathe sphinx

cd ${ZEPHYRREPO_STATE}
source zephyr-env.sh
cd doc
make htmldocs > "$log_file" 2>&1
../scripts/filter-known-issues.py --config-dir .known-issues/doc/ doc.log > doc.warnings
test -s doc.warnings && cat doc.warnings && exit 1
