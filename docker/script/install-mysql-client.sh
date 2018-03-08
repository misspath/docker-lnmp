#!/bin/bash

source $(cd `dirname $0`; pwd)/library.sh

#
# Install command `php`
#
if [ `cat ${profile} | grep 'alias de-mysql' | wc -l | awk '{print $1}'` == 0 ]; then
    color 35 'Build alias for run `mysql`'
    echo "alias de-mysql='de-container-mysql mysql'" >> ${profile}
    color 34 'You can use command `de-mysql` substitution `mysql` now'
fi

if [ `cat ${profile} | grep 'alias de-mysqldump' | wc -l | awk '{print $1}'` == 0 ]; then
    color 35 'Build alias for run `mysqldump`'
    echo "alias de-mysqldump='de-container-mysql mysqldump'" >> ${profile}
    color 34 'You can use command `de-mysqldump` substitution `mysqldump` now'
fi

color 32 'Completed configure.'
color 33 "You should run the command manually\n\n    source ${profile}"

# -- eof --