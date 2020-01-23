#!/bin/bash
#
# @file test.sh
# @brief run bats test

source ../src/utils.sh
source ../src/docker.sh

bats bats/utils.bats
bats bats/docker.bats