#!/usr/bin/env bash

set -e

hlint ./src/CIS194/Homework*/Exercise*.hs ./test/CIS194/Homework*/Exercise*.hs
stack test --coverage --ghc-options="-Wall -Werror"

# https://wiki.haskell.org/Haskell_program_coverage
# stack hpc report --all 2>&1 | hpc-threshold
