echo -e "\e[36m >>>>>> configuring Nodejs repos <<<<<<\e[0m"
curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -

echo -e "\e[36m >>>>>> Install Nodejs <<<<<<\e[0m"
dnf install nodejs -y

echo -e "\e[36m >>>>>> Add Application user <<<<<<\e[0m"
useradd roboshop

echo -e "\e[36m >>>>>> Create application directory <<<<<<\e[0m"
mkdir /app

echo -e "\e[36m >>>>>> Download app content <<<<<<\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app

echo -e "\e[36m >>>>>> unzip app content <<<<<<\e[0m"
unzip /tmp/catalogue.zip

echo -e "\e[32m >>>>>> Install Nodejs dependencies <<<<<<\e[0m"
npm install

echo -e "\e[36m >>>>>> Copy Catalogue Service file <<<<<<\e[0m"
cp /root/roboshop-shell/catalogue.service /etc/systemd/system/catalogue.service

echo -e "\e[36m >>>>>> start catalogue service <<<<<<\e[0m"
systemctl daemon-reload
systemctl enable catalogue
systemctl restart catalogue

echo -e "\e[36m >>>>>> copy mongodb repo <<<<<<\e[0m"
cp /root/roboshop-shell/mongo.repo /etc/yum.repos.d/mongo.repo

echo -e "\e[36m >>>>>> Install mongodb client <<<<<<\e[0m"
dnf install mongodb-org-shell -y

echo -e "\e[36m >>>>>> Load schema <<<<<<\e[0m"
mongo --host monogdb.madhari123.shop </app/schema/catalogue.js
