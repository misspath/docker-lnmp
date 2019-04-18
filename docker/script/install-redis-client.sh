#!/bin/bash

source $(cd `dirname $0`; pwd)/library.sh

#
# Install command `php`
#
if [ `cat ${profile} | grep 'alias app-redis' | wc -l | awk '{print $1}'` == 0 ]; then
    color 35 'Build alias for run `redis`'
    echo "alias app-redis='app-container-redis redis-cli'" >> ${profile}
    color 34 'You can use command `app-redis` substitution `redis-cli` now'
fi

color 32 'Completed configure.'
color 33 "You should run the command manually\n\n    source ${profile}"

# -- eof --