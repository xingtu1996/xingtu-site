# 行途 XingTu · 个人作品集站点

> **一线 AI 工程化实践者的个人主页** —— 文章 / 开源 / 视频 / 关注，一个入口。
> 零依赖 · 纯静态 · 免费托管（Cloudflare Pages）· 自动 HTTPS · 免备案

`xingtu1996.pages.dev` ← 这就是「行途 / XingTu」品牌在 Web 上的家。

---

## ✨ 这是什么

「行途」是资深 AI 工程化实践者（技术管理者 + 一线编码双身份）的自媒体品牌。
本站是它的**自有阵地**：公众号是"租的地"，这里是"自己的地"——内容永生的诺亚方舟，
同时是出海（Dev.to / Substack）的统一母舰。

## 🗂 站点板块

| 板块 | 内容 |
|------|------|
| 关于 | 我是谁 / 人设一句话 |
| 文章 | 精选技术实战长文（AI 工具链 / Harness / 工程化） |
| 视频 | 视频号 / B 站精选 |
| 开源 | 自研工具作品集（1 项目 1 仓库） |
| 关注 | 公众号 / 掘金 / 知乎 / 小红书 全平台入口 |

## 📁 目录结构

```
xingtu-site/
├── index.html    # 站点本体（零依赖单文件，内容数组化）
├── deploy.sh     # 一键部署脚本
└── README.md     # 本文件
```

## 🚀 快速开始（本地预览）

```bash
# 直接双击 index.html，或起本地服务：
python3 -m http.server 8000   # 打开 http://localhost:8000
```

## ☁️ 部署（三选一）

| 方式 | 适合 | 说明 |
|------|------|------|
| **GitHub 关联**（推荐） | 留 git 历史、push 即自动部署 | Cloudflare Pages → Connect to Git → 构建目录 `/` |
| **Wrangler CLI** | 一行命令 | `npx wrangler pages deploy . --project-name=xingtu1996` |
| **直接拖拽** | 最傻瓜 | Cloudflare Pages → Upload assets → 拖入 index.html |

详细步骤见下节。

## ✏️ 更新内容

所有文章 / 视频 / 开源 / 关注入口都集中在 `index.html` 底部的 `<script>` 数组
（`ARTICLES` / `VIDEOS` / `REPOS` / `FOLLOW`），把 `url` 换成真实链接即可，**样式无需动**。
每次 `git push` 后自动重新部署。

## 🛠 详细部署（Cloudflare Pages）

1. 仓库已推到 GitHub（`xingtu1996/xingtu-site`）。
2. 打开 https://dash.cloudflare.com → **Workers & Pages** → **Create** → **Pages** → **Connect to Git**。
3. 选 `xingtu-site` 仓库 → **Begin setup**。
4. 构建配置：Framework preset `None` · Build command 留空 · Build output directory `/`。
5. **Save and Deploy**，约 30 秒后上线。

> 想绑真域名：注册 `xingtu.dev`（自动续费 + 拉满 10 年）→ Pages 项目 → Custom domains → 加 CNAME。

## ⚠️ 避坑提醒（血泪经验）

- **别碰 Vercel / Netlify 免费版**：条款禁商用，做知识星球 / 广告变现会被封号。
- **GitHub Pages 免费但仓库必公开、国内极慢**：不适合做主阵地。
- **`.top/.xyz` 首年 9.9 是引流**：续费飙到 60–80，别碰。
- **区块链域名（.crypto/.eth）不是标准 DNS**：用户浏览器打不开，做 IP 阵地是死路。

## 📜 许可

私有仓库，仅供个人品牌运营使用。

---

_行途 · 一线 AI 工程化实践者，用 Harness 把普通模型拉到生产级。_
