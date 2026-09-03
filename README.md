# 行途 XingTu · 个人作品集站点（代码即文档）

> **一线 AI 工程化实践者的个人主页** —— 文章 / 开源 / 视频 / 关注，一个入口。
> 零依赖 · 纯静态 · 免费托管（Cloudflare Pages）· 自动 HTTPS · 免备案
> **本仓库 = 站点源码 + 部署脚本 + 管理手册**（管理原理、控制台入口、日常操作全在这，看仓库即会管理）

生产地址：**https://xingtu1996.pages.dev** ｜ 名片备胎：https://xingtu1996.github.io

![Deploy](https://img.shields.io/badge/deploy-Cloudflare%20Pages-orange.svg)
![Site](https://img.shields.io/badge/site-xingtu1996.pages.dev-blue.svg)
![Dependencies](https://img.shields.io/badge/dependencies-0-brightgreen.svg)
![HTTPS](https://img.shields.io/badge/HTTPS-enabled-brightgreen.svg)

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
├── deploy.sh     # 一键部署脚本（wrangler）
├── README.md     # 本文件（源码 + 管理手册）
```

---

## 🔑 管理入口（控制台直达）

| 用途 | 地址 |
|------|------|
| Workers & Pages 总览 | https://dash.cloudflare.com/418485f70719069ab3b9c18979656ccd/workers-and-pages |
| **Pages 项目 xingtu1996 详情** | https://dash.cloudflare.com/418485f70719069ab3b9c18979656ccd/pages/view/xingtu1996 |
| API Tokens 管理 | https://dash.cloudflare.com/profile/api-tokens |
| GitHub 仓库 | https://github.com/xingtu1996/xingtu-site |
| GitHub Pages 名片仓库 | https://github.com/xingtu1996/xingtu1996.github.io |

> Account ID：`418485f70719069ab3b9c18979656ccd`（上面 URL 里那段，管理/API 都要用）

---

## 🧠 管理原理（白盒，看懂就能自诊）

### 部署链路（三层）
```
本地 xingtu-site/ ──① git push──▶ GitHub 远程仓库（备份/版本控制）
      │
      └──② wrangler/上传──▶ Cloudflare Pages（发布台）──③ CDN──▶ 用户浏览器
```
- **当前发布通道 = ②**（手动 `deploy.sh` 或 wrangler）；① 只是备份；
- 未来接 **GitHub 自动部署**（虚线）后，`git push` 即触发 ②，token 可退休。

### 发布原理（不可变快照）
- 每次部署 = 一个**不可变版本**（类似 git commit），有专属 URL（如 `cd719a2c.xingtu1996.pages.dev`）；
- **production 指针**指向最新版；旧版全保留 → 出错 **Rollback 一秒恢复**；
- Cloudflare **无服务器进程**：文件存边缘存储、全球 300+ 节点分发 → 不会挂、免维护。

### 免费原理（为什么 0 元）
- 免费层 = 获客漏斗；静态托管边际成本≈0；金主是企业 CDN/安全合同；
- 个人站流量（几百请求/天）离免费额度（10 万/天）差几个数量级 → **事实永久免费**。

---

## ⚡ 快速管理手册

### 1. 日常更新内容（最常用）
改 `index.html` 底部的 `ARTICLES` / `VIDEOS` / `REPOS` / `FOLLOW` 数组 → 样式零改动。
```bash
cd ~/工作室/xingtu/xingtu-site
git add -A && git commit -m "更新内容"
git push                       # ① 备份到 GitHub
./deploy.sh                    # ② 发布到 pages.dev（当前手动通道）
```
> 接好 GitHub 自动部署后，`git push` 就够了，deploy.sh 可弃用。

### 2. 出问题回滚
控制台 → Pages 项目 → **Deployments** → 选上一版 → **Rollback**（1 秒恢复）。

### 3. 绑自定义域名（转正）
控制台 → Pages 项目 → **Custom domains** → Add custom domain →
DNS 在 CF 托管自动加记录 / 别处加 CNAME（域名 → xingtu1996.pages.dev）→ CF 自动签 HTTPS。

### 4. 看流量
控制台 → Pages 项目 → **Analytics**。

### 5. 接 GitHub 自动部署（推荐，token 退休）
控制台 → Pages 项目 → **Settings → Builds & deployments** → **Connect to Git** →
选 `xingtu-site` → 构建目录 `/` → 保存。此后 `git push` 自动上线。

### 6. 命令行发布（无控制台时）
```bash
CLOUDFLARE_API_TOKEN=xxx ./deploy.sh
# 或手动：
CLOUDFLARE_API_TOKEN=xxx npx -y wrangler pages deploy . --project-name=xingtu1996
```

### 7. 吊销/轮换凭证（安全）
| 凭证 | 管理入口 | 备注 |
|------|----------|------|
| Cloudflare API Token | https://dash.cloudflare.com/profile/api-tokens | 暴露即 revoke；接 Git 后不再需要 |
| GitHub 密码/PAT | https://github.com/settings/security ｜ settings/tokens | 暴露即改/删 |
| SSH key | https://github.com/settings/keys | `xingtu-mbp` |

---

## ⚠️ 安全须知（红线）

- **凭证不入聊天/不入仓库**：密码/PAT/Token 一旦暴露立即 revoke；
- **commit 邮箱**：一律 GitHub noreply（`274853659+xingtu1996@users.noreply.github.com`），**禁止公司邮箱**；
- 本仓库 private，公开前先清 commit 历史公司邮箱（filter-repo + force-push）；
- 登录/改绑定/申诉由本人操作（AI 只做提醒与模板）。

---

## 🚀 快速开始（本地预览）

```bash
python3 -m http.server 8000   # 打开 http://localhost:8000
```

## ⚠️ 避坑提醒（血泪经验）

- **别碰 Vercel / Netlify 免费版**：条款禁商用，做知识星球 / 广告变现会被封号。
- **GitHub Pages 免费但仓库必公开、国内极慢**：不适合做主阵地（名片备胎可以）。
- **`.top/.xyz` 首年 9.9 是引流**：续费飙到 60–80，别碰。
- **区块链域名（.crypto/.eth）不是标准 DNS**：用户浏览器打不开，做 IP 阵地是死路。

## 📜 许可

私有仓库，仅供个人品牌运营使用。

---

_行途 · 一线 AI 工程化实践者，用 Harness 把普通模型拉到生产级。_
