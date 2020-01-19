if [[ $(command -v kcov) ]]; then
    [[ -d coverage ]] || mkdir coverage
    kcov --exclude-pattern=docs/,etc/,tests/,*.yml,coverage,/usr,/tmp,.git,.*,*.md,.*.yml coverage test.sh
else
    wget https://github.com/SimonKagstrom/kcov/archive/master.tar.gz
    tar xzf master.tar.gz
    rm -rf master.tar.gz
    cd kcov-master
    mkdir build
    cd build
    cmake ..
    make
    make install
    cd ../..
    rm -rf kcov-master
    [[ -d coverage ]] || mkdir coverage
    kcov --exclude-pattern=docs/,etc/,tests/,*.yml,coverage,/usr,/tmp,.git,.*,*.md,.*.yml coverage test.sh
fi

