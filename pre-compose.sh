# run this script becfore docker-compose as sudo

sudo rm -rf dbdata

mkdir dbdata

sudo rm -rf ./html/*
cp -r ./rawVtiger/* ./html/*
