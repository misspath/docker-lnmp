#!/bin/bash

source $(cd `dirname $0`; pwd)/library.sh

#
# Install command `php`
#
if [ `cat ${profile} | grep 'alias app-mysql' | wc -l | awk '{print $1}'` == 0 ]; then
    color 35 'Build alias for run `mysql`'
    echo "alias app-mysql='app-container-mysql mysql'" >> ${profile}
    color 34 'You can use command `app-mysql` substitution `mysql` now'
fi

if [ `cat ${profile} | grep 'alias app-mysqldump' | wc -l | awk '{print $1}'` == 0 ]; then
    color 35 'Build alias for run `mysqldump`'
    echo "alias app-mysqldump='app-container-mysql mysqldump'" >> ${profile}
    color 34 'You can use command `app-mysqldump` substitution `mysqldump` now'
fi

if [ `cat ${profile} | grep 'alias app-mysqlbinlog' | wc -l | awk '{print $1}'` == 0 ]; then
    color 35 'Build alias for run `mysqlbinlog`'
    echo "alias app-mysqlbinlog='app-container-mysql mysqlbinlog'" >> ${profile}
    color 34 'You can use command `app-mysqlbinlog` substitution `mysqlbinlog` now'
fi

color 32 'Completed configure.'
color 33 "You should run the command manually\n\n    source ${profile}"

# -- eof --