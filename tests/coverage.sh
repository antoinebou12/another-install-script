#!/usr/bin/env bash
#
# @file coverage.sh
# @brief file generate the code coverage for bats/bash

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/../src/utils.sh"

# @description download kcov
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install_kcov() {
    local DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
    if [[ ! -f "$DIR"/bin/kcov ]]; then
        git clone https://github.com/SimonKagstrom/kcov.git
        cd kcov
        mkdir build
        cd build
        cmake .. -DCMAKE_INSTALL_PREFIX=/
        make
        make install DESTDIR=../../
        cd ../..
        rm -rf ../../share
        rm -rf ../../bin/kcov-system-daemon
        rm -rf "$DIR"/kcov

    fi
    return 0
}

# @description generate coverage
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
use_kcov() {
    local DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
    install_kcov
    [[ -d "$DIR"/coverage ]] || mkdir "$DIR"/coverage
    if [[ -f "$DIR"/bin/kcov ]]; then
        "$DIR"/bin/kcov --exclude-pattern=docs/,etc/,tests/,*.yml,coverage,/usr,/tmp,.git,.*,*.md,.*.yml,src/image/,vm/ coverage tests.sh > /dev/null 2>&1
    fi
    return 0
}

# @description send to codecov coverage
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
bash_codecov() {
    bash <(curl -s https://codecov.io/bash) -s coverage
    return 0
}

use_kcov
bash_codecov
