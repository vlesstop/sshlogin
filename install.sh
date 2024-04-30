#!/bin/bash

# 提示用户输入 Telegram Bot Token
read -p "请输入 Telegram Bot Token: " token

# 提示用户输入 Telegram Chat ID
read -p "请输入 Telegram Chat ID: " id

# 下载脚本并给予执行权限
sudo curl -sL https://raw.githubusercontent.com/vlesstop/sshlogin/main/script.sh -o /etc/profile.d/ssh_login_alert.sh
sudo chmod +x /etc/profile.d/ssh_login_alert.sh

# 运行脚本并传递参数
/etc/profile.d/ssh_login_alert.sh "$token" "$id"
