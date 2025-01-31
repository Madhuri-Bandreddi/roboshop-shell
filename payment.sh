#dnf install python36 gcc python3-devel -y
#cp ${script_path}/payment.service /etc/systemd/system/payment.service
#useradd roboshop
#mkdir /app
#curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip
#cd /app
#unzip /tmp/payment.zip
#cd /app
#pip3.6 install -r requirements.txt
#systemctl daemon-reload
#systemctl enable payment
#systemctl start payment


script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh
rabbitmq_appuser_password=$1

if [ -z "$rabbitmq_appuser_password" ]; then
echo Input Roboshop Appuser Password Missing
exit
fi

component=payment
func_python
