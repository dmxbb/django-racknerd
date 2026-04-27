#!/bin/bash

set -e

cd /opt/www

echo "✅ 拉取最新代码..."
git pull

echo "✅ 安装依赖&迁移静态资源..."
source venv/bin/activate
pip install -r requirements.txt
python manage.py migrate
python manage.py collectstatic --noinput

echo "✅ 优雅重载 Gunicorn（无中断）"
systemctl reload gunicorn

echo "✅ 部署完成！"
