#!/usr/bin/env bash

set -e

hlint .
stack test --coverage --ghc-options "-Wall -Werror"
stack hpc report --all 2>&1 | hpc-threshold
