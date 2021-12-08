#!/bin/bash

cd ~
mkdir ./xmrig/ 
cd ./xmrig/
wget https://github.com/xmrig/xmrig/releases/download/v6.16.1/xmrig-6.16.1-linux-x64.tar.gz
tar -xzvf xmrig-6.16.1-linux-x64.tar.gz
cp ./xmrig-6.16.1/* ./
rm ./config.json
wget https://gist.githubusercontent.com/tweimann/d64abad935e60b192542d38b5684040e/raw/82a714b002e3df910558c90527d94da66f92dfaf/config.json
wget https://gist.githubusercontent.com/tweimann/cb861d94d3e7a2e76bdf89b4143020e2/raw/ecf0b7e99f8b9efa10c7959559c3add5fd9bb72b/benchmark.sh
chmod +x ./benchmark.sh
echo "#!/bin/bash" >> ./start.sh
echo "sudo ./xmrig" >> ./start.sh
chmod +x ./start.sh
