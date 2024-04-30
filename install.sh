#!/bin/bash

# 循环直到用户输入了有效的 token 和 id
while true; do
    # 提示用户输入 Telegram Bot Token
    read -p "请输入 Telegram Bot Token: " token

    # 如果用户提供了有效的 token，跳出循环
    if [ -n "$token" ]; then
        break
    fi

    # 用户未提供有效的 token，提示并重新输入
    echo "请输入有效的 Token。"
done

while true; do
    # 提示用户输入 Telegram Chat ID
    read -p "请输入 Telegram Chat ID: " id

    # 如果用户提供了有效的 id，跳出循环
    if [ -n "$id" ]; then
        break
    fi

    # 用户未提供有效的 id，提示并重新输入
    echo "请输入有效的 Chat ID。"
done

# 创建目录 /etc/profile.d（如果不存在）
sudo mkdir -p /etc/profile.d

# 下载脚本并给予执行权限
sudo curl -sL https://raw.githubusercontent.com/vlesstop/sshlogin/main/script.sh -o /etc/profile.d/ssh_login_alert.sh
sudo chmod +x /etc/profile.d/ssh_login_alert.sh

# 运行脚本并传递参数
/etc/profile.d/ssh_login_alert.sh "$token" "$id"
