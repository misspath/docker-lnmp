#!/bin/bash

source $(cd `dirname $0`; pwd)/library.sh

if [ `sudo docker images -a | grep 'front' | wc -l | awk '{print $1}'` == 0 ]; then
    color 35 'Build command about front'
    cat $(cd `dirname $0`; pwd)/dockerfile/front | sudo docker build -t front -
fi

if [ `cat ${profile} | grep 'alias de-front' | wc -l | awk '{print $1}'` == 0 ]; then
    color 35 'Build alias for `node`、`npm`、`cnpm`'
    echo "alias de-front='sudo docker run --rm -v \$(pwd):/app front'" >> ${profile}
    echo "alias de-node='de-front node'" >> ${profile}
    echo "alias de-npm='de-front npm'" >> ${profile}
    echo "alias de-cnpm='de-front cnpm'" >> ${profile}
    color 34 'You can use command\n\n    `de-node` substitution `node`\n    `de-(c)npm` substitution `(c)npm`'
fi


color 32 'Completed install.'
color 33 "You should run the command manually\n\n    source ${profile}"

# -- eof --