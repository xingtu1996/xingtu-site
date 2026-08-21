#!/usr/bin/env bash
# ============================================================
# 行途 xingtu1996.pages.dev 一键部署脚本（Cloudflare Pages）
# 用法：
#   1) ./deploy.sh                          # 浏览器登录 Cloudflare 后部署（首次）
#   2) CLOUDFLARE_API_TOKEN=xxx ./deploy.sh # 用 API Token 直连（免浏览器，可交给 AI）
# 前置：注册 Cloudflare 账号（dash.cloudflare.com）
# ============================================================
set -euo pipefail
cd "$(dirname "$0")"

echo "==> 部署到 Cloudflare Pages：xingtu1996.pages.dev"
echo "    （文件目录：$(pwd)）"

if [ -n "${CLOUDFLARE_API_TOKEN:-}" ]; then
  echo "    模式：API Token 直连"
  npx -y wrangler pages deploy . --project-name=xingtu1996
else
  echo "    模式：浏览器登录（首次会让你登录 Cloudflare）"
  npx -y wrangler pages deploy . --project-name=xingtu1996
fi

echo "==> 部署完成，访问：https://xingtu1996.pages.dev"
