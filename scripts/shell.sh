# shell.sh

shellrc=<%= env[:shell_profile] %>
conf="source .virtualenvwrapper-conf"
touch $shellrc
grep -q "$conf" $shellrc || echo "$conf" >> $shellrc
