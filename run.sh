#!/bin/bash

LOG_DIR=$(pwd)/logs


git checkout main
git remote add upstream https://github.com/MystenLabs/sui.git
git fetch upstream
git pull upstream main
git add .
git commit -m "merge with upstream/main" 

git cherry-pick 596fb2d731c02bd63db8db02c999341920f4e17d

git stash push Cargo.lock
git add .
git commit -m "merge with instrumented_yield_id"
git push origin main

MSIM_TEST_SCHEDULE=1-2,3-4,2-2,2-4,5-2,4-5 LOCAL_MSIM_PATH=/home/ubuntu/mysten-sim-x cargo simtest --no-fail-fast --test-threads=1 &> $(pwd)/logs/log_06292023.txt
