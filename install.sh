#!/bin/bash

token=""
id=""

# 循环直到用户输入了有效的 token 和 id
while [ -z "$token" ] || [ -z "$id" ]; do
    # 提示用户输入 Telegram Bot Token
    read -p "请输入 Telegram Bot Token: " token

    # 提示用户输入 Telegram Chat ID
    read -p "请输入 Telegram Chat ID: " id

    # 如果用户没有提供 token 或 id，则重复提示
    if [ -z "$token" ] || [ -z "$id" ]; then
        echo "请提供有效的 Token 和 Chat ID。"
    fi
done

# 创建目录 /etc/profile.d（如果不存在）
sudo mkdir -p /etc/profile.d

# 下载脚本并给予执行权限
sudo curl -sL https://raw.githubusercontent.com/vlesstop/sshlogin/main/script.sh -o /etc/profile.d/ssh_login_alert.sh
sudo chmod +x /etc/profile.d/ssh_login_alert.sh

# 运行脚本并传递参数
/etc/profile.d/ssh_login_alert.sh "$token" "$id"
