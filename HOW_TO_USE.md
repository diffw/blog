# 📝 博客使用指南

## 1. 如何发布新文章 (How to Create Posts)

### 方法 1: 使用 Hugo 命令（推荐）

```bash
# 在项目根目录运行
hugo new posts/my-article-name.md
```

这会创建一个新文件在 `content/posts/my-article-name.md`，包含默认的 front matter。

### 方法 2: 手动创建

直接在 `content/posts/` 目录下创建新的 Markdown 文件。

### 文章模板

每篇文章需要包含 front matter（文件开头的 YAML 配置）：

```markdown
---
title: "文章标题"
date: 2025-11-27T10:00:00+08:00
draft: false
categories: ["设计", "生活"]
tags: ["标签1", "标签2"]
description: "文章描述（用于SEO和摘要）"
---

# 文章标题

这里是文章内容...

## 二级标题

更多内容...
```

### 发布文章步骤

1. **创建文章**
   ```bash
   hugo new posts/my-new-post.md
   ```

2. **编辑文章**
   - 打开 `content/posts/my-new-post.md`
   - 编辑内容
   - 将 `draft: true` 改为 `draft: false`（发布）

3. **本地预览**
   ```bash
   hugo server -D  # 包含草稿
   # 或
   hugo server     # 仅已发布
   ```
   访问 http://localhost:1313 查看

4. **推送到 GitHub**
   ```bash
   git add content/posts/my-new-post.md
   git commit -m "Add new post: my-new-post"
   git push
   ```
   GitHub Actions 会自动部署

### 文章 Front Matter 说明

- `title`: 文章标题
- `date`: 发布日期（格式：YYYY-MM-DDTHH:MM:SS+08:00）
- `draft`: `true` = 草稿（不发布），`false` = 已发布
- `categories`: 分类数组，如 `["设计", "生活"]`
- `tags`: 标签数组，如 `["博客", "分享"]`
- `description`: 文章描述（用于SEO和首页摘要）

---

## 2. 如何使用第三方主题 (How to Use Third-Party Themes)

### 方法 1: 作为 Git Submodule（推荐）

```bash
# 1. 添加主题作为 submodule
git submodule add https://github.com/theme-author/theme-name.git themes/theme-name

# 2. 更新 config.toml
# 将 theme = 'modern-blog' 改为 theme = 'theme-name'

# 3. 提交更改
git add .gitmodules config.toml
git commit -m "Add new theme"
git push
```

### 方法 2: 直接下载

```bash
# 1. 下载主题到 themes 目录
cd themes
git clone https://github.com/theme-author/theme-name.git

# 2. 更新 config.toml
# theme = 'theme-name'

# 3. 提交（注意：不要提交整个主题，只提交配置）
```

### 方法 3: 使用 Hugo Modules（高级）

```bash
# 1. 初始化 modules
hugo mod init github.com/yourusername/blog

# 2. 在 config.toml 中添加
# [module]
#   [[module.imports]]
#     path = "github.com/theme-author/theme-name"

# 3. 获取主题
hugo mod get -u
```

### 推荐的主题网站

- [Hugo Themes](https://themes.gohugo.io/) - 官方主题库
- [Awesome Hugo Themes](https://github.com/hugomods/themes) - 社区推荐

### 注意事项

- 使用第三方主题前，先备份当前主题
- 检查主题是否支持你需要的功能（暗色模式、搜索等）
- 某些主题可能需要额外配置

---

## 3. 如何修改当前主题 (How to Modify Current Theme)

当前主题位于 `themes/modern-blog/`

### 修改样式 (CSS)

编辑 `themes/modern-blog/assets/css/main.css`

```bash
# 直接编辑文件
code themes/modern-blog/assets/css/main.css
```

修改后：
```bash
git add themes/modern-blog/assets/css/main.css
git commit -m "Update theme styles"
git push
```

### 修改布局 (HTML Templates)

主题模板位于 `themes/modern-blog/layouts/`：

- `layouts/index.html` - 首页
- `layouts/_default/single.html` - 单篇文章
- `layouts/_default/list.html` - 列表页
- `layouts/partials/header.html` - 头部
- `layouts/partials/footer.html` - 底部

### 修改 JavaScript

编辑 `themes/modern-blog/assets/js/` 下的文件

### 覆盖主题文件（推荐方法）

如果你想修改主题但保持可更新性，可以在项目根目录创建同名文件来覆盖：

```bash
# 例如，覆盖 header 模板
mkdir -p layouts/partials
cp themes/modern-blog/layouts/partials/header.html layouts/partials/header.html
# 然后编辑 layouts/partials/header.html
```

Hugo 会优先使用项目根目录的文件，而不是主题中的文件。

### 修改配置

某些主题配置在 `config.toml` 的 `[params]` 部分。

---

## 4. GitHub Pages 隐私问题 (GitHub Pages Privacy)

### 是的，内容在 GitHub 上是公开的

**重要说明：**
- ✅ GitHub 仓库是**公开的**（除非你使用付费的私有仓库）
- ✅ 任何人都可以在 GitHub 上看到你的源代码和内容
- ✅ 你的 Markdown 文件、配置、主题代码都是可见的

### 隐私选项

#### 选项 1: 使用私有仓库 + GitHub Pages（需要付费）

- GitHub Free: 不支持私有仓库的 Pages
- GitHub Pro ($4/月): 支持私有仓库的 Pages
- GitHub Team/Enterprise: 企业级功能

#### 选项 2: 使用其他托管服务

- **Netlify** - 免费，支持私有 Git 仓库
- **Vercel** - 免费，支持私有 Git 仓库
- **Cloudflare Pages** - 免费，支持私有 Git 仓库
- **自建服务器** - 完全控制

#### 选项 3: 接受公开性

- 如果你只是写博客分享，公开性可能不是问题
- 很多知名博客都是公开的
- 可以只发布你想分享的内容

### 保护隐私的建议

1. **不要提交敏感信息**
   - 不要在文章中包含个人信息、密码、API密钥等
   - 使用 `.gitignore` 排除敏感文件

2. **使用环境变量**
   - 对于需要保密的信息，使用环境变量
   - 不要在代码中硬编码

3. **审查内容**
   - 发布前检查是否包含不想公开的信息

4. **使用草稿功能**
   - 敏感内容保持 `draft: true`
   - 只在准备好时发布

### 迁移到其他平台

如果你想迁移到支持私有的平台：

#### Netlify 部署示例

```bash
# 1. 在 Netlify 连接你的 GitHub 仓库
# 2. 构建设置：
#    Build command: hugo --minify
#    Publish directory: public
# 3. 环境变量（如果需要）：
#    HUGO_VERSION = 0.152.2
```

---

## 📚 更多资源

- [Hugo 官方文档](https://gohugo.io/documentation/)
- [Hugo 内容管理](https://gohugo.io/content-management/)
- [GitHub Pages 文档](https://docs.github.com/en/pages)


