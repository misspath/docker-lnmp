#!/bin/bash

function color()
{
    color=$1
    message=$2
    begin=${3-"\t\n"}
    end=${4-"\t\n"}

    echo -e "${begin}\033[1;${color}m${message}\033[0;0m${end}"
}

profile=~/.bash_profile

sudo docker --version | grep 'Docker version' > /dev/null

if [ $? != 0 ]; then
    color 31 'Must install docker first'
    exit 9
fi

if [ ! -f ${profile} ]; then
    color 35 "Touch file '${profile}'"
    touch ${profile}
fi

if [ `cat ${profile} | grep 'alias dk-container-fpm' | wc -l | awk '{print $1}'` == 0 ]; then
    echo "alias dk-container-fpm=\"sudo docker exec -it \`sudo docker ps -a --format='table {{.ID}}\t{{.Image}}' | grep 'fpm' | awk '{print \$1}'\`\"" >> ${profile}
fi

if [ `cat ${profile} | grep 'alias dk-container-mysql' | wc -l | awk '{print $1}'` == 0 ]; then
    echo "alias dk-container-mysql=\"sudo docker exec -it \`sudo docker ps -a --format='table {{.ID}}\t{{.Image}}' | grep 'mysql' | awk '{print \$1}'\`\"" >> ${profile}
fi

if [ `cat ${profile} | grep 'alias dk-container-nginx' | wc -l | awk '{print $1}'` == 0 ]; then
    echo "alias dk-container-nginx=\"sudo docker exec -it \`sudo docker ps -a --format='table {{.ID}}\t{{.Image}}' | grep 'nginx' | awk '{print \$1}'\`\"" >> ${profile}
fi

# -- eof --