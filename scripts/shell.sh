# shell.sh

conf="source .virtualenvwrapper-conf"
grep -q "$conf" "$shellrc" || echo "$conf" >> "$shellrc"
