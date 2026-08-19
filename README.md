# 行途 XingTu · 作品集站点部署指南

> 目标：`xingtu1996.pages.dev` 零元上线，自动 HTTPS，免 ICP 备案。
> 站点文件：`index.html`（零依赖、纯静态，Cloudflare Pages 可直接托管）。

---

## 方案概述

| 项 | 选择 | 理由 |
|---|---|---|
| 托管 | **Cloudflare Pages** | 永久免费、无限带宽、可商用、支持私有仓库、国内访问在境外平台中最快、自动 HTTPS |
| 子域 | `xingtu1996.pages.dev` | 0 元拥有“像真域名”的入口，接住「行途 / XingTu」品牌资产 |
| 备案 | 不需要 | 服务器在境外（Cloudflare），国内访问略慢但免备案即可公开 |
| 后续升级 | 买 `xingtu.dev`（~$12–15/年）绑自定义域 | 大厂背书、开发者向、更贴 AI 工具链人设 |

---

## 路径 A：GitHub 关联（推荐，留 git 历史，最稳）

1. 把本目录（`xingtu-site/`）初始化为 Git 仓库并推到 GitHub：
   ```bash
   cd xingtu-site
   git init && git add . && git commit -m "feat: 行途 XingTu MVP 作品集"
   # 在 GitHub 新建仓库 xingtu-site，然后：
   git branch -M main
   git remote add origin git@github.com:<你的用户名>/xingtu-site.git
   git push -u origin main
   ```
2. 打开 https://dash.cloudflare.com → **Workers & Pages** → **Create** → **Pages** → **Connect to Git**。
3. 选 `xingtu-site` 仓库 → **Begin setup**。
4. 构建配置：
   - **Framework preset**：`None`
   - **Build command**：留空
   - **Build output directory**：`/`（根目录，因为 index.html 就在根）
5. 点 **Save and Deploy**。约 30 秒后拿到 `https://xingtu1996.pages.dev`。

> 之后每次 `git push` 自动重新部署，git 历史本身也是你「建站历程」的内容素材。

---

## 路径 B：Wrangler CLI（一行命令，无需 GitHub）

```bash
# 安装（用 WorkBuddy 管理的 node）
/Users/lijiacheng/.workbuddy/binaries/node/versions/22.22.2/bin/npx wrangler pages deploy . --project-name=xingtu1996
```

首次会引导你登录 Cloudflare 账号（浏览器授权）。部署完直接给 `*.pages.dev` 地址。

> 想让我帮你一键推？把 Cloudflare 的 **API Token**（Workers 权限）贴给我，我用 wrangler 直接部署。

---

## 路径 C：直接拖拽（最傻瓜）

打开 https://dash.cloudflare.com → **Workers & Pages** → **Pages** → **Upload assets**，
把本目录的 `index.html` 拖进去即可，无需 Git、无需 CLI。

---

## 后续：绑定真域名（可选）

等你想“转正”拥有真域名时：

1. 在 Cloudflare 注册 `xingtu.dev`（或你喜欢的 `.dev/.io`），开**自动续费 + 注册年限拉满 10 年**。
2. 在 Pages 项目 → **Custom domains** → 添加 `xingtu.dev`，按提示加一条 CNAME 解析即可。
3. 改 `index.html` 顶部 `<meta property="og:url">` 注释为真实域名。

国内 SEO 路线另购 `xingtu1996.cn` 做 ICP 备案（7–20 天），同一品牌双轨，互不冲突。

---

## 内容怎么填

所有文章 / 视频 / 开源 / 关注入口都集中在 `index.html` 底部的 `<script>` 数组里
（`ARTICLES` / `VIDEOS` / `REPOS` / `FOLLOW`），把 `url` 换成你的真实链接即可，**样式无需动**。

---

## 避坑提醒

- **别碰 Vercel / Netlify 免费版**：条款禁商用，你做知识星球 / 广告变现会被封号。
- **GitHub Pages 免费但仓库必公开、国内极慢**：不适合做主阵地。
- **`.top/.xyz` 首年 9.9 是引流**：续费飙到 60–80，别碰。
- **区块链域名（.crypto/.eth）不是标准 DNS**：用户浏览器打不开，做 IP 阵地是死路。
