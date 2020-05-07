#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]
then
	echo "Docker commands must be run as root"
	exit
fi

docker run --rm -p 8080:5000 crwn-clothing