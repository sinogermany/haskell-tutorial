Travis Build: [![Build Status](https://travis-ci.com/sinogermany/haskell-tutorial.svg?branch=master)](https://travis-ci.com/sinogermany/haskell-tutorial)

# Haskell Tutorial

This repo consists of exercises to learn Haskell and Functional Programming.

Currently it consists of exercises from [`Haskell CIS194`](https://www.seas.upenn.edu/~cis194/fall16/).

## Project Structure

The project structure follows the normal convention:
- [`src`](src) contains the implementation of the exercises. E.g. the `CIS194.Homework01.Exercise01` module.
- [`test`](test) contains `Tasty.HSpec` specs of the exported functions from the modules in [`src`](src).
- [`test/Spec.hs`](test/Spec.hs) is the test auto-discovery driver.
- [`scripts`](scripts) contains useful shell scripts to be run in CI pipelines, docker containers and local environments.

## Code Style

We try to follow [the guideline from haskell.org](https://wiki.haskell.org/Programming_guidelines) in most cases,
however we will also occasionally make some minor adjustment. Style check is done by [`hlint`](https://hackage.haskell.org/package/hlint).

## Installing dependencies

See dependencies specified in [`package.yaml`](package.yaml).
- To install the dependencies in your local environment, run `stack build --test --only-dependencies`.
- To run the code in a docker container, run `docker-compose build haskell`.

## Running the tests (docker required)

- Build the docker image `docker-compose build haskell` (takes a few minutes)
- Run the style check and test `docker-compose run --rm haskell ./scripts/docker/style-check-and-unit-test.sh`
- Test coverage report will be included in the console output.

## Useful Links

- [haskell.org](https://www.haskell.org/)
- [What I wish I knew when learning Haskell (Stephen Diehl)](http://dev.stephendiehl.com/hask/)
- [Hoogλe](https://hoogle.haskell.org/)
- [PF-Complete Haskell](https://haskell.fpcomplete.com/)
