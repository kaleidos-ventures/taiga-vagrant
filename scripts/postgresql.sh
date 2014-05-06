# postgresql.sh

apt-install-if-needed postgresql postgresql-contrib

sudo -u postgres createuser --superuser $USER &> /dev/null
sudo -u postgres createdb $USER &> /dev/null
