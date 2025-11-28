# 个人博客

基于 Hugo 构建的现代简洁个人博客，支持暗色模式、全文搜索、RSS 订阅和 SEO 优化。

## ✨ 功能特点

- 🎨 **现代简洁设计** - 清爽的界面，优雅的排版
- 🌙 **暗色模式** - 支持明暗主题切换，保护眼睛
- 📱 **完全响应式** - 完美适配桌面、平板和移动设备
- 🔍 **全文搜索** - 快速搜索文章标题和内容
- 📡 **RSS 订阅** - 支持 RSS feed 订阅
- 🏷️ **分类标签** - 灵活的文章分类和标签系统
- ⚡ **快速加载** - 优化的性能，快速访问
- 🔎 **SEO 优化** - 完整的 SEO 配置，包括 sitemap 和 meta 标签

## 🚀 快速开始

### 1. 安装 Hugo

需要安装 **Hugo Extended** 版本（支持资源处理）：

**macOS:**
```bash
brew install hugo
```

**其他系统:**
访问 [Hugo 官方安装指南](https://gohugo.io/installation/)

### 2. 本地开发

```bash
# 启动开发服务器
hugo server -D

# 访问 http://localhost:1313 查看博客
```

### 3. 创建新文章

```bash
# 使用 Hugo 命令创建
hugo new posts/my-new-post.md

# 或直接在 content/posts/ 目录下创建 Markdown 文件
```

编辑文章后，记得将 front matter 中的 `draft: true` 改为 `draft: false`

## 📝 配置博客

编辑 `config.toml` 文件来配置博客：

- `baseURL` - 你的网站域名
- `title` - 博客标题
- `params.author` - 作者名称
- `params.description` - 博客描述
- `params.darkMode` - 是否启用暗色模式（默认：true）
- `params.searchEnabled` - 是否启用搜索（默认：true）

## 🚢 部署到 GitHub Pages

详细的部署指南请查看 [DEPLOYMENT.md](./DEPLOYMENT.md)

### 快速部署步骤：

1. 创建 GitHub 仓库并推送代码
2. 在仓库 Settings > Pages 中选择 "GitHub Actions" 作为源
3. 工作流会自动构建和部署
4. 配置自定义域名（可选）

## 📁 项目结构

```
.
├── config.toml          # 主配置文件
├── content/             # 内容目录
│   ├── posts/          # 文章目录
│   └── about.md        # 关于页面
├── themes/             # 主题目录
│   └── modern-blog/    # 自定义主题
├── static/             # 静态文件（robots.txt, CNAME 等）
├── .github/            # GitHub Actions 工作流
└── README.md           # 说明文档
```

## 🎨 使用说明

### 文章 Front Matter

每篇文章的 front matter 示例：

```yaml
---
title: "文章标题"
date: 2024-01-01T10:00:00+08:00
draft: false
categories: ["设计", "生活"]
tags: ["博客", "分享"]
description: "文章描述（用于 SEO 和摘要）"
---
```

### 分类和标签

- **分类 (categories)**: 用于主要分类，如"设计"、"生活"
- **标签 (tags)**: 用于更细粒度的标记

### 搜索功能

- 点击右上角搜索图标打开搜索框
- 输入关键词实时搜索
- 支持标题和内容全文搜索

### 暗色模式

- 点击右上角主题切换按钮
- 偏好设置会自动保存到本地

## 📚 更多信息

- [Hugo 官方文档](https://gohugo.io/documentation/)
- [部署指南](./DEPLOYMENT.md)

## 📄 许可证

MIT License

