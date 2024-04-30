#!/bin/bash

# 从文件中读取 token 和 chat_id
token=$(cat ~/.ssh_login_token)
id=$(cat ~/.ssh_login_chat_id)

# 获取服务器主机名
hostname=$(hostname)

# 获取登录用户信息
login_info=$(who | awk '{print $1}')

# 获取最近登录信息
last_login=$(last -1 | awk '{print $1,$3,$4,$5,$6}')

# 获取本机IP地址
local_ip=$(curl -s ifconfig.me)

# 获取被登录服务器IP地址
login_ip=$(echo $SSH_CONNECTION | awk '{print $1}')

# 拼接通知消息，包含服务器主机名、登录IP地址、登录用户信息和最近登录信息
message="🔔 发生SSH登录！
🖥️ 服务器：${hostname} 
 ${local_ip}
🔒 登录IP地址：
(${login_ip})
👤 登录用户信息：
${login_info}
📅 最近登录信息：
${last_login}"

# 发送通知消息
curl -s -X POST "https://api.telegram.org/bot${token}/sendMessage" -d "chat_id=${id}&text=${message}"

echo "已发送SSH登录通知！"
