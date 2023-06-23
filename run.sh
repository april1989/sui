#!/bin/bash

LOG_DIR=$(pwd)/logs


git checkout main
git remote add upstream https://github.com/MystenLabs/sui.git
git fetch upstream
git merge upstream/master
git add .
git commit -m "merge with upstream/main" 

git cherry-pick 596fb2d731c02bd63db8db02c999341920f4e17d
git stash push Cargo.lock

