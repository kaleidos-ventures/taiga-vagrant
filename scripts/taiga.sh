# taiga.sh

# setup taiga-front
cd data/taiga-front

npm-install-if-needed gulp bower

npm install
bower install

cd

# setup taiga-back
mkvirtualenv-if-needed taiga
createdb-if-needed taiga
workon taiga

cd data/taiga-back

pip install -r requirements.txt

sh ./install.sh

cd
