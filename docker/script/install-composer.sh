#!/bin/bash

source $(cd `dirname $0`; pwd)/library.sh

if [ `sudo docker images -a | grep 'composer' | wc -l | awk '{print $1}'` == 0 ]; then
    color 35 'Pull library/composer:latest'
    sudo docker pull library/composer:latest
fi

if [ `cat ${profile} | grep 'alias app-composer' | wc -l | awk '{print $1}'` == 0 ]; then
    color 35 'Build alias for `composer`'
    echo "alias app-composer='sudo docker run --privileged=true --rm -v \$(pwd):/app library/composer'" >> ${profile}
    color 34 'You can use command `app-composer` substitution `composer` now'
fi

color 32 'Completed install.'
color 33 "You should run the command manually\n\n    source ${profile}"

# -- eof --