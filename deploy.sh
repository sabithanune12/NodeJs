#!/bin/bash

tar czf NodeJs.tar.gz main.js package.json public LICENSE
scp NodeJs.tar.gz nanogram@nanogram.io:~
rm NodeJs.tar.gz

ssh nanogram@nanogram.io << 'ENDSSH'
pm2 stop all
rm -rf easyio
mkdir easyio
tar xf NodeJs.tar.gz -C easyio
rm NodeJs.tar.gz
cd NodeJs 
npm i
pm2 start all
ENDSSH
