# 快速开始指南

## 📋 接下来的步骤

### 1️⃣ 安装 Hugo（如果还没有安装）

**macOS:**
```bash
brew install hugo
```

**验证安装:**
```bash
hugo version
```
确保安装的是 **Extended** 版本（支持资源处理）

### 2️⃣ 配置你的博客信息

编辑 `config.toml` 文件，更新以下信息：

- **baseURL**: 你的域名（例如：`https://yourdomain.com`）
- **title**: 你的博客标题
- **params.author**: 你的名字
- **params.description**: 博客描述
- **params.keywords**: 关键词（用逗号分隔）
- **params.github/twitter/email**: 社交媒体链接（可选）

### 3️⃣ 配置自定义域名（如果使用）

编辑 `static/CNAME` 文件，将 `yourdomain.com` 替换为你的实际域名。

### 4️⃣ 本地测试博客

```bash
# 在项目根目录运行
hugo server -D

# 访问 http://localhost:1313 查看博客
```

按 `Ctrl+C` 停止服务器。

### 5️⃣ 创建你的第一篇文章

**方法 1: 使用 Hugo 命令**
```bash
hugo new posts/my-first-post.md
```

**方法 2: 手动创建**
在 `content/posts/` 目录下创建新的 Markdown 文件。

**文章模板:**
```markdown
---
title: "文章标题"
date: 2024-01-01T10:00:00+08:00
draft: false
categories: ["设计", "生活"]
tags: ["标签1", "标签2"]
description: "文章描述"
---

# 文章标题

这里是文章内容...
```

### 6️⃣ 部署到 GitHub Pages

#### 步骤 A: 创建 GitHub 仓库

1. 在 GitHub 上创建新仓库（例如：`my-blog`）
2. **不要**初始化 README、.gitignore 或 license

#### 步骤 B: 初始化 Git 并推送代码

```bash
# 初始化 Git（如果还没有）
git init

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: Hugo blog setup"

# 添加远程仓库（替换为你的仓库地址）
git remote add origin https://github.com/yourusername/your-repo.git

# 推送到 GitHub
git branch -M main
git push -u origin main
```

#### 步骤 C: 启用 GitHub Pages

1. 进入仓库的 **Settings** > **Pages**
2. 在 **Source** 部分，选择 **GitHub Actions**
3. 等待 GitHub Actions 自动构建和部署（通常需要 1-2 分钟）
4. 部署完成后，访问 `https://yourusername.github.io/your-repo/`

#### 步骤 D: 配置自定义域名（可选）

1. 在仓库 **Settings** > **Pages** 中，在 **Custom domain** 输入你的域名
2. 在你的域名 DNS 设置中添加 A 记录：
   - 类型：A
   - 主机记录：@
   - 记录值：`185.199.108.153`, `185.199.109.153`, `185.199.110.153`, `185.199.111.153`
3. 等待 DNS 生效（可能需要几分钟到几小时）

### 7️⃣ 日常使用

#### 创建新文章
```bash
hugo new posts/article-name.md
```

#### 本地预览（包含草稿）
```bash
hugo server -D
```

#### 本地预览（仅发布）
```bash
hugo server
```

#### 构建静态网站
```bash
hugo
```
生成的文件在 `public/` 目录

#### 推送更新到 GitHub
```bash
git add .
git commit -m "Add new post: article name"
git push
```
GitHub Actions 会自动重新部署。

## 🎯 检查清单

- [ ] 安装 Hugo Extended
- [ ] 更新 `config.toml` 中的个人信息
- [ ] 本地测试博客（`hugo server -D`）
- [ ] 创建第一篇文章
- [ ] 创建 GitHub 仓库
- [ ] 推送代码到 GitHub
- [ ] 启用 GitHub Pages
- [ ] 配置自定义域名（如果需要）
- [ ] 开始写作！

## ❓ 常见问题

**Q: 搜索功能不工作？**
A: 确保 `config.toml` 中 `params.searchEnabled = true`，并且构建时生成了 `index.json`

**Q: 暗色模式不切换？**
A: 检查浏览器控制台是否有 JavaScript 错误，确保 `params.darkMode = true`

**Q: 部署后样式丢失？**
A: 确保使用 Hugo Extended 版本，GitHub Actions 已配置 `extended: true`

**Q: 如何修改主题样式？**
A: 编辑 `themes/modern-blog/assets/css/main.css` 文件

## 📚 更多帮助

- [Hugo 官方文档](https://gohugo.io/documentation/)
- [详细部署指南](./DEPLOYMENT.md)
- [项目 README](./README.md)


