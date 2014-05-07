# repos.sh

if [ -z $(which git) ]; then
    apt-install git
fi

if [ ! -e ~/data/taiga-back ]; then
    git clone https://github.com/taigaio/taiga-back.git data/taiga-back
fi

if [ ! -e ~/data/taiga-front ]; then
    git clone https://github.com/taigaio/taiga-front.git data/taiga-front
fi
