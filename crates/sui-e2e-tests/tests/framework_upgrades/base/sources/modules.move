// Copyright (c) Mysten Labs, Inc.
// SPDX-License-Identifier: Apache-2.0

module sui_system::msim_extra_1 {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct Type has drop {
        x: u64,
    }

    struct Obj has key {
        id: UID,
    }

    struct AlmostObj {
        id: UID,
    }

    public fun canary(): u64 {
        private_function(41)
    }

    entry fun mint(ctx: &mut TxContext) {
        transfer::transfer(
            Obj { id: object::new(ctx) },
            tx_context::sender(ctx),
        )
    }

    entry fun entry_fun() {}

    fun private_function(x: u64): u64 {
        private_function_2(x) + 1
    }

    fun private_function_2(x: u64): u64 { x }
    fun private_function_3(_x: u64) {}

    public fun generic<T: copy + drop>(_t: T) {}
}
