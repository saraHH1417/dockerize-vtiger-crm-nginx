# run this script becfore docker-compose as sudo

# docker network create vtiger_network

# the order of creating services with up command:
# 1- mysql 2- php 3- nginx // if we up the nginx service before the php service, it will fail
sudo rm -rf dbdata

mkdir dbdata

sudo rm -rf ./html/*
cp -r ./rawVtiger/* ./html/*
