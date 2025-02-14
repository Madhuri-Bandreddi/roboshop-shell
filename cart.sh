#echo -e "\e[36m >>>>>> configuring Nodejs repos <<<<<<\e[0m"
#curl -sl https://rpm.nodesource.com /setup_lts.x | bash
#
#echo -e "\e[36m >>>>>> Install Nodejs <<<<<<\e[0m"
#dnf install nodejs -y
#
#echo -e "\e[36m >>>>>> Add Application user <<<<<<\e[0m"
#useradd roboshop
#
#echo -e "\e[36m >>>>>> Create application directory <<<<<<\e[0m"
#rm -rf /app
#mkdir /app
#
#echo -e "\e[36m >>>>>> Download app content <<<<<<\e[0m"
#curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
#cd /app
#
#echo -e "\e[36m >>>>>> unzip app content <<<<<<\e[0m"
#unzip /tmp/cart.zip
#
#echo -e "\e[36m >>>>>> Install Nodejs dependencies <<<<<<\e[0m"
#npm install
#
#echo -e "\e[36m >>>>>> Copy cart Service file <<<<<<\e[0m"
#cp ${script_path}/cart.service /etc/systemd/system/cart.service
#
#echo -e "\e[36m >>>>>> start cart service <<<<<<\e[0m"
#systemctl daemon-reload
#systemctl enable cart
#systemctl restart cart

script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh

component=cart

func_nodejs