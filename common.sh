script_path=$(dirname $0)
source ${script_path}/common.sh
echo $app_user
exit
useradd ${app_user}

