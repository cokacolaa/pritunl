#!/bin/bash
echo "Bat dau cai dat..."
echo ""
echo "Updating Packages..."
echo ""
echo ""
sleep 2s

sudo apt update

echo ""
echo ""
echo "Install Prerequisite Packages..."
echo ""
echo ""
sleep 2s

sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

echo ""
echo ""
echo "Them repo vao sourcelist "
echo ""
echo ""

sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list << EOF
deb https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse
EOF

sudo tee /etc/apt/sources.list.d/pritunl.list << EOF
deb https://repo.pritunl.com/stable/apt focal main
EOF

sudo apt-get --assume-yes install gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A

echo ""
echo ""
echo "Updating repo "
echo ""
echo ""
sleep 2s

sudo apt-get update

echo ""
echo ""
echo "Cai dat openVPN "
echo ""
echo ""
sleep 2s
sudo apt-get --assume-yes install pritunl mongodb-org

echo ""
echo ""
echo "Khoi chạy vpn server "
echo ""
echo ""
sleep 2s
sudo systemctl start pritunl mongod
sudo systemctl enable pritunl mongod

echo ""
echo ""
echo "SETUP KEY "
echo ""
echo ""
sleep 2s
sudo pritunl setup-key

echo ""
echo ""
echo "DA HOAN THANH CAI DAT OPEN VPN SERVER"
echo ""
echo ""
echo "WEB UI : http://ip_host"

