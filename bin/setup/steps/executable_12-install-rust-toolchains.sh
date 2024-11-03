#!/bin/bash

if ! command -v rustup >/dev/null 2>&1; then
    echo "Rust not installed, skipping step"
    exit 0
fi

echo "Installing the stable toolchain"
rustup toolchain install stable

echo "Installing the nightly toolchain"
rustup toolchain install nightly
