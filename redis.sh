#dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
#dnf module enable redis:remi-6.2 -y
#dnf install redis -y
#sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/redis.conf
#systemctl enable redis
#systemctl restart redis


script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh

func_print_head "Install Redis Repos"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y &>>$log_file
func_stat_check $?

func_print_head "Install Redis"
dnf module enable redis:remi-6.2 -y &>>$log_file
yum install redis -y &>>$log file
func_stat_check $?

func_print_head "Update Redis Listen Address"
sed -i -e 's|127.0.0.1|0.0.0.0| ' /etc/redis.conf /etc/redis/redis.conf &>$log file
func_stat_check $?

func_print_head "Start Redis Service"
systemctl enable redis &>>$log file
systemctl restart redis &>>$log file
func_stat_check $?