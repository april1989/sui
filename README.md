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
Or add it to your environment variable. e.g.,
```shell
MSIM_TEST_SEED=1 LOCAL_MSIM_PATH=/Users/bozhen/Documents/Sui-Proj/mysten-sim cargo simtest test_create_advance_epoch_tx_race
```




### Note
1. remove `.await` from `crates/sui-macros/src/lib.rs:150` due to compiler error.
