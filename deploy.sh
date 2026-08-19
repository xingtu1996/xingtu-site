***REMOVED***!/usr/bin/env bash
***REMOVED*** ============================================================
***REMOVED*** 行途 xingtu1996.pages.dev 一键部署脚本（Cloudflare Pages）
***REMOVED*** 用法：
***REMOVED***   1) ./deploy.sh                          ***REMOVED*** 浏览器登录 Cloudflare 后部署（首次）
***REMOVED***   2) CLOUDFLARE_API_TOKEN=xxx ./deploy.sh ***REMOVED*** 用 API Token 直连（免浏览器，可交给 AI）
***REMOVED*** 前置：注册 Cloudflare 账号（dash.cloudflare.com）
***REMOVED*** ============================================================
set -euo pipefail
cd "$(dirname "$0")"

NODE_BIN="/Users/<user>/.workbuddy/binaries/node/versions/22.22.2/bin"
echo "==> 部署到 Cloudflare Pages：xingtu1996.pages.dev"
echo "    （文件目录：$(pwd)）"

if [ -n "${CLOUDFLARE_API_TOKEN:-}" ]; then
  echo "    模式：API Token 直连"
  "$NODE_BIN/npx" -y wrangler pages deploy . --project-name=xingtu1996
else
  echo "    模式：浏览器登录（首次会让你登录 Cloudflare）"
  "$NODE_BIN/npx" -y wrangler pages deploy . --project-name=xingtu1996
fi

echo "==> 部署完成，访问：https://xingtu1996.pages.dev"
