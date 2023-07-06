#!/usr/bin/env bash
# SPDX-License-Identifier: MIT

# Move to the parent directory of where script is.
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
DIR="$( cd -P "$( dirname "$SOURCE" )/.." && pwd )"
cd "$DIR"

# Remove any existing bindings.
rm -rf src/abi/*


# ERC20 binding.
abigen --abi abi/spruce-sdk/src/abis/json/ERC20ABI.json --pkg joedex --type ERC20 --out src/abi/ERC20.go
# v1 bindings
abigen --abi abi/spruce-sdk/src/abis/json/JoePairABI.json --pkg joedex --type JoePairV1 --out src/abi/JoePairV1.go
abigen --abi abi/JoeFactory.json --pkg joedex --type JoeFactoryV1 --out src/abi/JoeFactoryV1.go
