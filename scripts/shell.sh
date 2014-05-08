# shell.sh

shellrc=<%= env[:shell_profile] %>

confs=(.virtualenvwrapper-conf .session-conf)

touch $shellrc

for conf in "${confs[@]}"; do
    line="source ~/$conf"
    grep -q "$line" $shellrc || echo "$line" >> $shellrc
done
