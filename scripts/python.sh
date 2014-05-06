# python.sh

apt-install-if-needed python3-pip

pip3 install --user virtualenv virtualenvwrapper

source ~/.virtualenvwrapper-conf

function mkvirtualenv-if-needed {
    for envname in $@; do
        $(lsvirtualenv | grep -q "$envname") || mkvirtualenv "$envname" -p $(which python3)
    done
}
