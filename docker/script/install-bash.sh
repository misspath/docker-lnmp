#!/bin/bash

source $(cd `dirname $0`; pwd)/library.sh

#
# Install for execute script`
#
if [ `cat ${profile} | grep 'alias de-bash' | wc -l | awk '{print $1}'` == 0 ]; then
(
cat <<'EOF'
de-bash()
{
    script=`test ${1} && echo /web/${1} || echo bash`
    de-container-fpm ${script}
}
EOF
) >> ${profile}
    color 34 'You can use command `de-bash [script file]` execute script now'
fi

color 32 'Completed configure.'
color 33 "You should run the command manually\n\n    source ${profile}"

# -- eof --