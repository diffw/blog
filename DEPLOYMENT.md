# 部署指南

## 本地开发

### 1. 安装 Hugo

需要安装 Hugo Extended 版本（支持 SCSS）：

**macOS:**
```bash
brew install hugo
```

**其他系统:**
访问 https://gohugo.io/installation/

### 2. 启动开发服务器

```bash
hugo server -D
```

访问 http://localhost:1313 查看博客

### 3. 创建新文章

```bash
hugo new posts/my-new-post.md
```

编辑 `content/posts/my-new-post.md`，完成后将 `draft: true` 改为 `draft: false`

## 部署到 GitHub Pages

### 1. 配置仓库

1. 在 GitHub 创建新仓库
2. 将代码推送到仓库：
```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/yourusername/your-repo.git
git push -u origin main
```

### 2. 配置 GitHub Pages

1. 进入仓库 Settings > Pages
2. Source 选择 "GitHub Actions"
3. 工作流会自动构建和部署

### 3. 配置自定义域名

1. 在仓库根目录的 `static/CNAME` 文件中设置你的域名
2. 更新 `config.toml` 中的 `baseURL` 为你的域名
3. 在域名 DNS 设置中添加 A 记录：
   - 类型：A
   - 主机记录：@
   - 记录值：GitHub Pages 的 IP 地址（通常是 185.199.108.153, 185.199.109.153, 185.199.110.153, 185.199.111.153）
4. 也可以添加 CNAME 记录指向 `yourusername.github.io`

### 4. 更新配置

编辑 `config.toml`：
- 修改 `baseURL` 为你的域名
- 修改 `title` 为你的博客标题
- 修改 `params.author` 为你的名字
- 更新社交媒体链接（如果需要）

## 功能说明

### 搜索功能
- 点击右上角搜索图标打开搜索
- 支持标题和内容全文搜索
- 搜索结果实时显示

### 暗色模式
- 点击右上角主题切换按钮
- 偏好设置会保存在本地

### RSS 订阅
- 访问 `/index.xml` 获取 RSS feed
- 在 footer 中有 RSS 链接

### SEO 优化
- 自动生成 sitemap.xml
- 完整的 meta 标签
- Open Graph 和 Twitter Card 支持
- robots.txt 配置

## 目录结构

```
.
├── config.toml          # 配置文件
├── content/             # 内容目录
│   ├── posts/          # 文章目录
│   └── about.md        # 关于页面
├── themes/             # 主题目录
│   └── modern-blog/    # 自定义主题
├── static/             # 静态文件
├── .github/            # GitHub Actions 配置
└── README.md           # 说明文档
```

## 常见问题

### 搜索功能不工作？
确保 `config.toml` 中 `params.searchEnabled = true`，并且构建时生成了 `index.json`

### 暗色模式不切换？
检查浏览器控制台是否有 JavaScript 错误

### 部署后样式丢失？
确保使用 Hugo Extended 版本，并且 GitHub Actions 使用 `extended: true`

