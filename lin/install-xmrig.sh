#!/bin/bash

cd ~
mkdir ./xmrig/ 
cd ./xmrig/
wget https://github.com/xmrig/xmrig/releases/download/v6.15.2/xmrig-6.15.2-linux-x64.tar.gz
tar -xzvf xmrig-6.15.2-linux-x64.tar.gz
cp ./xmrig-6.15.2/* ./
rm ./config.json
wget https://gist.githubusercontent.com/tweimann/96935446958cd1adf438caa08db88d83/raw/a920180f8b8c5daf715c801ce5c19a3bcc9a52c5/config.json

echo "sudo ./xmrig" >> ./start.sh
chmod +x ./start.sh
