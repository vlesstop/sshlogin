#!/bin/bash

# 检查是否提供了必要的参数
if [ $# -ne 2 ]; then
    echo "Usage: $0 <token> <chat_id>"
    exit 1
fi

# 下载脚本并给予执行权限
curl -sL https://raw.githubusercontent.com/yourusername/yourrepository/main/script.sh -o ssh_login_alert.sh
chmod +x ssh_login_alert.sh

# 运行脚本并传递参数
./ssh_login_alert.sh $1 $2
