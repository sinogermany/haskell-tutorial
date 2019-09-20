[![Build Status](https://travis-ci.com/sinogermany/haskell-tutorial.svg?branch=master)](https://travis-ci.com/sinogermany/haskell-tutorial)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# Haskell Tutorial

This repo consists of exercises to learn Haskell and Functional Programming.

Currently it consists of exercises from [`Haskell CIS194`](https://www.seas.upenn.edu/~cis194/spring13/).

## Project Structure

The project structure follows the normal convention:
- [`src`](src) contains the implementation of the exercises. E.g. the `CIS194.Homework01.Exercise01` module.
- [`test`](test) contains `Tasty.HSpec` specs of the exported functions from the modules in [`src`](src).
- [`test/Spec.hs`](test/Spec.hs) is the test auto-discovery driver.
- [`scripts`](scripts) contains useful shell scripts to be run in CI pipelines, docker containers and local environments.

## Code Style

- We try to follow [the guideline from haskell.org](https://wiki.haskell.org/Programming_guidelines) in most cases,
however we will also occasionally make some minor adjustment.
- Style check is done by [`hlint`](https://hackage.haskell.org/package/hlint).
- Code formatting is done by [`stylish-haskell`](https://hackage.haskell.org/package/stylish-haskell).

## Dev and test dependencies

To run the tests in the project, we need:
- Binary dependencies: `stylish-haskell`, `hlint`, `tasty-discover`, `hpc-threshold` and `stack-hpc-coveralls (CI only)`.
- Library dependencies: see dependencies specified in [`package.yaml`](package.yaml).

## Running the tests (in the local environment)

- To install the binary dependencies, run `stack install stylish-haskell hlint tasty-discover hpc-threshold`.
- To install the library dependencies, run `stack build --test --only-dependencies`.
- Run `./scripts/docker/style-check-and-unit-test.sh`.

## Running the tests (in a docker container)

- Before building the docker image, _DO_ _NOT_ _FORGET_ to increase the docker daemon RAM to 8GB or more.
- To build the docker image, run `docker-compose build haskell`.
- Run the style check and test `docker-compose run --rm haskell ./scripts/docker/style-check-and-unit-test.sh`.
- Test coverage report will be included in the console output.

## Useful Links

- [haskell.org](https://www.haskell.org/)
- [What I wish I knew when learning Haskell (Stephen Diehl)](http://dev.stephendiehl.com/hask/)
- [Hoogλe](https://hoogle.haskell.org/)
- [PF-Complete Haskell](https://haskell.fpcomplete.com/)
