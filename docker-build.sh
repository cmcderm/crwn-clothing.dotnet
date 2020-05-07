#!/usr/bin/env bash

DIR=$1

if [ $# -eq 0 ]
	then
	echo "docker-build.sh requires a directory as input e.g. ./docker-build.sh ."
	exit
fi

if [ "$EUID" -ne 0 ]
then
	echo "Docker commands must be run as root"
	exit
fi

docker build -t crwn-clothing $DIR