sudo apt-get -y update
sudo apt-get -y install git bash

git clone https://github.com/taigaio/taiga-scripts.git
cd taiga-scripts
git checkout improvements

mkdir -p ~/.setup
cat > ~/.setup/data.sh <<EOF
scheme="http"
hostname="localhost:8000"
EOF

bash setup-server.sh
