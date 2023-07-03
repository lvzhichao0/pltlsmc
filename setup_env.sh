#!/bin.sh
git init
git update
apt update
apt upgrade
apt install cmake
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
curl --proto '=https' --tlsv1.2 -sSf https://rsproxy.cn/rustup-init.sh | sh
source "$HOME/.cargo/env"
echo "[source.crates-io]
replace-with = 'rsproxy'
[source.rsproxy]
registry = \"https://rsproxy.cn/crates.io-index\"
[registries.rsproxy]
index = \"https://rsproxy.cn/crates.io-index\"
[net]
git-fetch-with-cli = true
" > ~/.cargo/config
cd ltl2ba
make -j
cd ..
