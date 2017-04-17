#!/bin/bash

sudo apt-get install doxygen make
sudo pip install breathe sphinx

cd ${ZEPHYRREPO_STATE}
source zephyr-env.sh
echo "- Building docs..."
exit 1
make htmldocs > doc.log 2>&1
echo "- Look for new warnings..."
./scripts/filter-known-issues.py --config-dir .known-issues/doc/ doc.log > doc.warnings
cat doc.warnings
test -s doc.warnings && exit 0 # FIXME

