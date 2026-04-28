#!/bin/bash
set -e

echo "====================================="
echo "     Django Docker 一键部署脚本"
echo "====================================="

# 1. 拉取最新代码
echo -e "\n[1/4] 拉取最新代码..."
git pull

# 2. 重新构建镜像并后台启动
echo -e "\n[2/4] 构建镜像 & 启动容器..."
docker compose up -d --build

# 3. 执行数据库迁移
echo -e "\n[3/4] 执行数据库迁移..."
docker compose exec -T django python manage.py migrate --noinput

# 4. 收集静态文件
echo -e "\n[4/4] 收集静态资源..."
docker compose exec -T django python manage.py collectstatic --noinput

echo -e "\n✅ 全部部署完成！"
echo "👉 访问地址：http://23.94.208.48/"