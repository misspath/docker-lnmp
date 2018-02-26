#!/bin/bash

source $(cd `dirname $0`; pwd)/library.sh

if [ `sudo docker images -a | grep 'front' | wc -l | awk '{print $1}'` == 0 ]; then
    color 35 'Build command about front'
    cat $(cd `dirname $0`; pwd)/dockerfile/front | sudo docker build -t front -
fi

if [ `cat ${profile} | grep 'alias dk-front' | wc -l | awk '{print $1}'` == 0 ]; then
    color 35 'Build alias for `node`、`npm`、`cnpm`'
    echo "alias dk-front='sudo docker run --rm -v \$(pwd):/app front'" >> ${profile}
    echo "alias dk-node='dk-front node'" >> ${profile}
    echo "alias dk-npm='dk-front npm'" >> ${profile}
    echo "alias dk-cnpm='dk-front cnpm'" >> ${profile}
    color 34 'You can use command\n\n    `dk-node` substitution `node`\n    `dk-(c)npm` substitution `(c)npm`'
fi


color 32 'Completed install.'
color 33 "You should run the command manually\n\n    source ${profile}"

# -- eof --