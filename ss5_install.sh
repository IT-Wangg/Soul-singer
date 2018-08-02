#!/bin/bash

yum install gcc openldap-devel pam-devel openssl-devel -y
wget http://jaist.dl.sourceforge.net/project/ss5/ss5/3.8.9-8/ss5-3.8.9-8.tar.gz
tar -vzx -f ss5-3.8.9-8.tar.gz
cd ss5-3.8.9/
./configure
make && make install
sleep 1
service ss5 start
chmod a+x /etc/init.d/ss5
echo "auth 0.0.0.0/0 – u" >> /etc/opt/ss5/ss5.conf
echo "permit u 0.0.0.0/0 – 0.0.0.0/0 – – – – -" >> /etc/opt/ss5/ss5.conf
read -p "请输入用户 密码" usr key 
echo "$usr $key" >> /etc/opt/ss5/ss5.passwd
service restart ss5
echo "ss5 create OK! The user is $usr,The password is $key!,The port is 1080!"
