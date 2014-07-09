# taiga.sh

# setup image processing support
apt-install-if-needed libjpeg-dev libfreetype6-dev zlib1g-dev

# setup taiga-layout
cd data/taiga-layout

gem-install-if-needed sass
npm-install-if-needed gulp bower

sudo npm install
bower install

cd

# setup taiga-back
mkvirtualenv-if-needed taiga
createdb-if-needed taiga
rabbit-create-user-if-needed taiga taiga  # username, password
rabbit-create-vhost-if-needed taiga
rabbit-set-permissions taiga taiga ".*" ".*" ".*" # username, vhost, configure, read, write

workon taiga

cd data/taiga-back

pip install -r requirements-devel.txt

# sh ./regenerate.sh

cd

# setup supervisor
sudo sh -c "cat > /etc/supervisor/conf.d/taiga.conf <<EOF
[program:taiga-celery]
command=/home/vagrant/.virtualenvs/taiga/bin/celery -A taiga.celery worker -l info
directory=/home/vagrant/data/taiga-back
stdout_logfile=/home/vagrant/celery.log
redirect_stderr=true
user=vagrant
autostart=true
autorestart=false
environment=HOME=/home/vagrant,USER=vagrant
EOF"
supervisor-restart

# setup rabbit
rabbit-activate-plugin rabbitmq_management
