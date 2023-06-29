#!/bin/bash

LOG_DIR=$(pwd)/logs


git checkout main
git remote add upstream https://github.com/MystenLabs/sui.git
git fetch upstream
git merge upstream/master