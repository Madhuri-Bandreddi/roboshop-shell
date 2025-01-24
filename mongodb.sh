cp mongod.service /etc/yum.repos.d/mongod.service
dnf install mongodb-org -y
sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/mongod.service
systemctl enable mongod
systemctl start mongod
systemctl restart mongod
