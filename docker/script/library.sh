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

if [ `cat ${profile} | grep 'alias iload' | wc -l | awk '{print $1}'` == 0 ]; then
    echo "alias iload=\"source ~/.bash_profile\"" >> ${profile}
    echo "alias ivim=\"sudo vim ~/.bash_profile\"" >> ${profile}
fi

if [ `cat ${profile} | grep 'export GODDESS' | wc -l | awk '{print $1}'` == 0 ]; then
    echo "export GODDESS=\$(ip route|awk '/default/ { print \$3 }')" >> ${profile}
    echo "export GODDESS2=\$(ifconfig | grep -E \"([0-9]{1,3}\.){3}[0-9]{1,3}\" | grep -v 127.0.0.1 | awk '{ print \$2 }' | cut -f2 -d: | head -n1)" >> ${profile}
fi


if [ `cat ${profile} | grep 'alias app-container-fpm' | wc -l | awk '{print $1}'` == 0 ]; then
    echo "alias app-container-fpm=\"sudo docker exec --privileged=true -i \`sudo docker ps -a --format='table {{.ID}}\t{{.Names}}' | grep '_app-fpm' | awk '{print \$1}'\`\"" >> ${profile}
fi

if [ `cat ${profile} | grep 'alias app-container-mysql' | wc -l | awk '{print $1}'` == 0 ]; then
    echo "alias app-container-mysql=\"sudo docker exec --privileged=true -i \`sudo docker ps -a --format='table {{.ID}}\t{{.Names}}' | grep '_app-mysql' | awk '{print \$1}'\`\"" >> ${profile}
fi

if [ `cat ${profile} | grep 'alias app-container-redis' | wc -l | awk '{print $1}'` == 0 ]; then
    echo "alias app-container-redis=\"sudo docker exec --privileged=true -i \`sudo docker ps -a --format='table {{.ID}}\t{{.Names}}' | grep '_app-redis' | awk '{print \$1}'\`\"" >> ${profile}
fi

if [ `cat ${profile} | grep 'alias app-container-nginx' | wc -l | awk '{print $1}'` == 0 ]; then
    echo "alias app-container-nginx=\"sudo docker exec --privileged=true -i \`sudo docker ps -a --format='table {{.ID}}\t{{.Names}}' | grep '_app-nginx' | awk '{print \$1}'\`\"" >> ${profile}
fi

# -- eof --