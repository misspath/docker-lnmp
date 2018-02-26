#!/bin/bash

source $(cd `dirname $0`; pwd)/library.sh

#
# Install command `php`
#
if [ `cat ${profile} | grep 'alias dk-mysql' | wc -l | awk '{print $1}'` == 0 ]; then
    color 35 'Build alias for run `mysql`'
    echo "alias dk-mysql='dk-container-mysql mysql'" >> ${profile}
    color 34 'You can use command `dk-mysql` substitution `mysql` now'
fi

if [ `cat ${profile} | grep 'alias dk-mysqldump' | wc -l | awk '{print $1}'` == 0 ]; then
    color 35 'Build alias for run `mysqldump`'
    echo "alias dk-mysqldump='dk-container-mysql mysqldump'" >> ${profile}
    color 34 'You can use command `dk-mysqldump` substitution `mysqldump` now'
fi

color 32 'Completed configure.'
color 33 "You should run the command manually\n\n    source ${profile}"

# -- eof --