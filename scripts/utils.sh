# utils.sh

red='\e[0;31m'
cyan='\e[0;36m'
black='\e[0;30m'
blue='\e[0;34m'
green='\e[0;32m'
cyan='\e[0;36m'
red='\e[0;31m'
purple='\e[0;35m'
orange='\e[0;33m'
light_gray='\e[0;37m'


function apt-install {
    for pkg in $@; do
        echo -e "${cyan}Installing package $pkg..."
        sudo apt-get install -yq $pkg
    done
}


function apt-install-if-needed {
    for pkg in $@; do
        if package-not-installed $pkg; then
            apt-install $pkg
        fi
    done
}


function package-not-installed {
    test -z $(sudo dpkg -s $1 2> /dev/null | grep Status | cut -d' ' -f4)
}
