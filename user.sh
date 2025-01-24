echo -e "\e[36m >>>>>> configuring Nodejs repos <<<<<<\e[0m"
curl -sl https://rpm.nodesource.com /setup_lts.x | bash

echo -e "\e[36m >>>>>> Install Nodejs <<<<<<\e[0m"
dnf install nodejs -y

echo -e "\e[36m >>>>>> Add Application user <<<<<<\e[0m"
useradd roboshop

echo -e "\e[36m >>>>>> Create application directory <<<<<<\e[0m"
rm -rf /app
mkdir /app

echo -e "\e[36m >>>>>> Download app content <<<<<<\e[0m"
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
cd /app

echo -e "\e[36m >>>>>> unzip app content <<<<<<\e[0m"
unzip /tmp/user.zip

echo -e "\e[36m >>>>>> Install Nodejs dependencies <<<<<<\e[0m"
npm install

echo -e "\e[36m >>>>>> Copy user Service file <<<<<<\e[0m"
cp /root/roboshop-shell/user.service /etc/systemd/system/user.service

echo -e "\e[36m >>>>>> start user service <<<<<<\e[0m"
systemctl daemon-reload
systemctl enable user
systemctl restart user
