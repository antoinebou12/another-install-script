#!/usr/bin/env bash
#
# @file coverage.sh
# @brief file generate the code coverage for bats/bash


# @description download the bi of kcov and generate coverage
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function use_kcov(){
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    if [[ -f  ${DIR}/bin/kcov ]]; then
        [[ -d coverage ]] || mkdir coverage
        ${DIR}/bin/kcov --exclude-pattern=docs/,etc/,tests/,*.yml,coverage,/usr,/tmp,.git,.*,*.md,.*.yml coverage tests.sh
        return 0
    else
        wget https://github.com/SimonKagstrom/kcov/archive/master.tar.gz
        tar xzf master.tar.gz
        rm -rf master.tar.gz
        cd kcov-master
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=${DIR} ..
        make
        if  [[ "$UID" -gt 0 ]]; then
            sudo make install
            sudo rm -rf ${DIR}/bin/kcov-system-daemon
            sudo rm -rf ${DIR}/share
        else
            make install
            rm -rf ${DIR}/bin/kcov-system-daemon
            rm -rf ${DIR}/share
        fi

        cd ../..

        if  [[ "$UID" -gt 0 ]]; then
            sudo rm -rf kcov-master
        else
            rm -rf kcov-master
        fi

        [[ -d coverage ]] || mkdir coverage

        ${DIR}/bin/kcov --exclude-pattern=docs/,etc/,tests/,*.yml,coverage,/usr,/tmp,.git,.*,*.md,.*.yml coverage tests.sh
        return 0
    fi
}


# @description send to codecov coverage
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function bash_codecov(){
    bash <(curl -s https://codecov.io/bash)
    return 0 
}

use_kcov
bash_codecov