***REMOVED***!/usr/bin/env bash
***REMOVED*** ============================================================
***REMOVED*** 行途 xingtu1996.pages.dev 一键部署脚本（Cloudflare Pages）
***REMOVED*** 用法：
***REMOVED***   1) ./deploy.sh                          ***REMOVED*** 自动读取本地配置部署
***REMOVED***   2) CLOUDFLARE_API_TOKEN=xxx ./deploy.sh ***REMOVED*** 用环境变量覆盖
***REMOVED*** 配置文件：~/.config/xingtu/cloudflare.env
***REMOVED*** 前置：注册 Cloudflare 账号（dash.cloudflare.com）
***REMOVED*** ============================================================
set -euo pipefail
cd "$(dirname "$0")"

echo "==> 部署到 Cloudflare Pages：xingtu1996.pages.dev"
echo "    （文件目录：$(pwd)）"

***REMOVED*** 优先读取本地配置文件
CONFIG_FILE="$HOME/.config/xingtu/cloudflare.env"
if [ -f "$CONFIG_FILE" ]; then
  echo "    模式：读取本地配置文件（$CONFIG_FILE）"
  set -a
  source "$CONFIG_FILE"
  set +a
elif [ -n "${CLOUDFLARE_API_TOKEN:-}" ]; then
  echo "    模式：环境变量 CLOUDFLARE_API_TOKEN"
else
  echo "    模式：浏览器登录（首次会让你登录 Cloudflare）"
fi

***REMOVED*** 验证Token是否已设置
if [ -z "${CLOUDFLARE_API_TOKEN:-}" ]; then
  echo "❌ 未找到 CLOUDFLARE_API_TOKEN"
  echo "   请在 ~/.config/xingtu/cloudflare.env 中配置，或设置环境变量"
  exit 1
fi

***REMOVED*** 执行部署
npx -y wrangler pages deploy . --project-name="${CLOUDFLARE_PAGES_PROJECT:-xingtu1996}"

echo "==> 部署完成，访问：https://xingtu1996.pages.dev"
