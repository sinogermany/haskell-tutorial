#!/usr/bin/env bash

set -e

function bin_directory() {
  mkdir -p /root/.local/bin/
  echo /root/.local/bin/
}

function github_release_download_urls() {
  curl -sS https://api.github.com/repos/$1/releases/latest | jq -r ".assets | .[] | .browser_download_url"
}

function latest_stylish_haskell_linux_binary_url() {
  github_release_download_urls jaspervdj/stylish-haskell | grep linux-x86_64.tar.gz
}

function download_and_install_latest_stylish_haskell_binary() {
  curl -OL $(latest_stylish_haskell_linux_binary_url)
  tar xvfz $(ls stylish-haskell-v*-linux-x86_64.tar.gz)
  mv $(ls -d stylish-haskell*/)stylish-haskell $(bin_directory)
  rm -rf stylish-haskell*
}

function latest_hlint_linux_binary_url() {
  github_release_download_urls ndmitchell/hlint | grep linux.tar.gz
}

function download_and_install_latest_hlint_binary() {
  curl -OL $(latest_hlint_linux_binary_url)
  tar xvfz $(ls hlint*.tar.gz)
  mv $(ls -d hlint*/)hlint $(bin_directory)
  mv $(ls -d hlint*/)data $(bin_directory)
  rm -rf hlint*
}

function latest_shc_linux_binary_url() {
  github_release_download_urls rubik/stack-hpc-coveralls | grep shc-linux-x64-8. | grep .tar.bz2
}

function download_and_install_latest_shc_binary() {
  curl -OL $(latest_shc_linux_binary_url)
  tar xvfj $(ls shc-linux-x64*.tar.bz2)
  mv ./shc $(bin_directory)
  rm -rf shc $(ls shc-linux-x64*.tar.bz2)
}

apt-get update
apt-get upgrade -y
apt-get install -y libpcre3-dev jq bzip2

download_and_install_latest_stylish_haskell_binary
download_and_install_latest_hlint_binary
download_and_install_latest_shc_binary

stack update
stack install tasty-discover hpc-threshold
stack build --test --only-dependencies
