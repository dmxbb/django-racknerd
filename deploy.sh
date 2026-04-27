#!/bin/bash

# 进入项目目录
cd /opt/www

echo "==================== 开始拉取代码 ===================="
git pull

echo "==================== 重启 Gunicorn ===================="
systemctl restart gunicorn

echo "==================== 重启 Nginx ===================="
systemctl restart nginx

echo "✅ 部署完成！"
