#!/bin/bash
#Vickyarts Github
#Contact me on Github
white='\e[1;37m'
green='\e[0;32m'
red='\e[1;31m'
yellow='\e[1;33m'
blue='\e[1;34m'

if [ $# -eq 1 ];
then
  touch ping.txt
  echo -e $green "IP range: $1"
  echo -e $blue "Hosts Alive:"
  range=$(echo "$1" | sed s/".0\/24"//)
  for ip in $(seq 1 254);
  do
    ping -c 1 $range.$ip >>ping.txt &
  done
  alive=$(cat ping.txt | grep "bytes from" | cut -d " " -f 4 | sed s/:// )
  echo -e $white "$alive"
  rm ping.txt
else
  echo -e $red "Invalid Syntax"
  echo -e $yellow "Usage:"
  echo -e $green "./Sweeper.sh <iprange>"
  echo -e $green "Example: Sweeper.sh 10.10.10.0/24"
fi
