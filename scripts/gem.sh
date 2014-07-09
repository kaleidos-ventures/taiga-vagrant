# gem.sh

function gem-install {
    for pkg in $@; do
        echo -e "${cyan}[NPM] Installing package $pkg..."
        sudo gem install -g $pkg
    done
}

function gem-install-if-needed {
    for pkg in $@; do
        if gem-package-not-installed $pkg; then
            gem-install $pkg
        fi
    done
}


function gem-package-not-installed {
    test -z $(gem list 2> /dev/null | grep "$1@" | cut -d' ' -f2 | tr -d '()')
}
