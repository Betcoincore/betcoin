#!/bin/bash
sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils
sudo apt-get install libboost-all-dev
sudo add-apt-repository ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install libdb4.8-dev libdb4.8++-dev
sudo apt-get install libminiupnpc-dev
sudo apt-get install libzmq3-dev

mkdir /root/temp
cd /root/temp
wget https://github.com/betcoincore/betcoin/files/2146370/ubuntu.tar.gz
tar -xvzf ubuntu.tar.gz
sleep 15
rm ubuntu.tar.gz

mkdir /root/bet
mkdir /root/.betcore
cp /root/temp/betd /root/bet
cp /root/temp/bet-cli /root/bet
cd /root/bet
sudo apt-get install -y pwgen
GEN_PASS=`pwgen -1 20 -n`
echo -e "rpcuser=betuser\nrpcpassword=${GEN_PASS}\nrpcallowip=127.0.0.1\nrpcport=25005\nport=25004\nserver=1\ndaemon=1\nlisten=1\nmaxconnections=256" > /root/.betcore/bet.conf
cd /root/bet
chmod 777 betd
chmod 777 bet-cli
./betd
sleep 100
masternodekey=$(./bet-cli masternode genkey)
./bet-cli stop
sleep 100
echo -e "masternode=1\nmasternodeprivkey=$masternodekey" >> /root/.betcore/bet.conf
./betd
sleep 10
echo "Masternode private key: $masternodekey"
echo "Job completed successfully"
