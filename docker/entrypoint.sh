#!/bin/sh

# COPY entrypoint.sh /entrypoint.sh
# RUN chmod 755 /entrypoint.sh
# ENTRYPOINT ["/entrypoint.sh"]


# -e 　若指令传回值不等于0，则立即退出shell
# -u 　当执行时使用到未定义过的变量，则显示错误信息
set -e

#echo "Starting the mysql daemon"
#service mysql start
#
#echo "navigating to volume /var/www"
#cd /var/www
#echo "Creating soft link"
#ln -s /opt/mysite mysite
#
#a2enmod headers
#service apache2 restart
#
#a2ensite mysite.conf
#a2dissite 000-default.conf
#service apache2 reload

# 如果参数为空，则
if [ -z "$1" ]
then
    exec /usr/sbin/sshd -D -e -f /etc/ssh/sshd_config_test_clion
else
    # 去掉第一个参数
    cmd="$1"; shift
    # 执行命令，传递剩余的所有参数
    exec $cmd "$@"
fi