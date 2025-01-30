script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh
echo $app_user
exit
useradd ${app_user}

