#!/usr/bin/env bash
# Filename: efg.sh

clNoColor='\033[0m'
clBlack='\033[0;30m'     
clRed='\033[0;31m'     
clGreen='\033[0;32m'     
clOrange='\033[0;33m'     
clBlue='\033[0;34m'     
clPurple='\033[0;35m'     
clCyan='\033[0;36m'     
clLight_Gray='\033[0;37m'
clDark_Gray='\033[1;30m'
clLight_Red='\033[1;31m'
clLight_Green='\033[1;32m'
clYellow='\033[1;33m'
clLight_Blue='\033[1;34m'
clLight_Purple='\033[1;35m'
clLight_Cyan='\033[1;36m'
clWhite='\033[1;37m'

if [[ $1 = 'pull' ]]
then
	git pull
fi

if [[ $1 = 'push' ]]
then
	msg="Auto $(date)"  
	git add --all
	git commit -m "$msg"
	echo -e "${clYellow}"
	git push
	echo -e "${clNoColor}"
	echo ""
	echo -e "${clLight_Red}Pushou ${clYellow}''$msg''${clLight_Red}"
	echo -e "${clNoColor}"
	echo ""	
fi

if [[ $1 = 'req' ]]
then
	pip freeze > requirements.txt
fi

if [[ $1 = 'docker' ]]
then
	docker container stop gdv_container
	docker container rm gdv_container
	docker build -t gdv:latest .
	docker run --name gdv_container -p 8000:8000 gdv:latest
fi

if [[ $1 = 'bash' ]]
then
	docker exec -it gdv_container bash
fi

if [[ $1 = 'run' ]]
then
	python manage.py runserver
fi

if [[ $1 = 'fly' ]]
then
	export FLYCTL_INSTALL="/home/ronie/.fly"
	export PATH="$FLYCTL_INSTALL/bin:$PATH"
fi




