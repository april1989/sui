<p align="center">
<img src="https://github.com/MystenLabs/sui/blob/main/doc/static/Sui_Icon_Brand.png" alt="Logo" width="100" height="100">
</p>

# Systematic Concurrency Testing for Sui

The original Sui README is [here](https://github.com/MystenLabs/sui/blob/main/README.md). 

This is a forked Sui repository for implementing a Systematic Concurrency Testing for distributed systems.

## Change Log

### Add test case

The test case is at `crates/sui/tests/reconfiguration_tests.rs`, and run by:

```shell
cargo simtest test_create_advance_epoch_tx_race
```

### How to install and Use `LOCAL_MSIM_PATH`

Install msim (simtest):
```shell
cd sui
./scripts/simtest/install.sh
LOCAL_MSIM_PATH=/path/to/your-mysten-sim-repo cargo simtest
```
Then it will start to run sim tests.

Always run `LOCAL_MSIM_PATH=/path/to/your-mysten-sim-repo cargo simtest` in sui so that you can test against local changes to mysten-sim without pushing it to git every time.
Use `RUST_BACKTRACE=1` to display a backtrace.
Or add it to your environment variable, e.g.,
```shell
MSIM_TEST_SEED=1 LOCAL_MSIM_PATH=/Users/bozhen/Documents/Sui-Proj/mysten-sim RUST_BACKTRACE=1 cargo simtest test_create_advance_epoch_tx_race
```
or use the `cargo-simtest` script, e.g., 
```shell
LOCAL_MSIM_PATH=/Users/bozhen/Documents/Sui-Proj/mysten-sim scripts/simtest/cargo-simtest simtest test_create_advance_epoch_tx_race
```



### Note
1. (tmp) remove `.await` from `crates/sui-macros/src/lib.rs:150` due to compiler error.
2. the test `test_create_advance_epoch_tx_race` was successful in Github Action (https://github.com/MystenLabs/sui/actions/runs/4452595845/jobs/7820370845#step:5:1836),
but I got a failed test on my machine (logs/log_test_create_advance_epoch_tx_race.txt) due to:
```shell
thread '<unnamed>' panicked at 'duplicate socket', /Users/bozhen/Documents/Sui-Proj/mysten-sim/msim/src/sim/net/mod.rs:163:9
```
