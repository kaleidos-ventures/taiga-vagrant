sudo apt-get -y update
sudo apt-get -y install git bash


rm -rf taiga-scripts
git clone https://github.com/taigaio/taiga-scripts.git
cd taiga-scripts

mkdir -p ~/.setup

cat > ~/.setup/data.sh <<EOF
scheme="http"
hostname="localhost:8000"
EOF

bash setup-server.sh
