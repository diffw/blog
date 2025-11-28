# 🚀 GitHub Pages 部署步骤

## 快速部署指南

### 步骤 1: 准备代码

所有文件已经准备好，Git 仓库已初始化。

### 步骤 2: 创建 GitHub 仓库

1. 访问 https://github.com/new
2. 输入仓库名称（例如：`my-blog`）
3. **不要**勾选 "Initialize this repository with a README"
4. 点击 "Create repository"

### 步骤 3: 连接本地仓库到 GitHub

```bash
# 添加远程仓库（替换为你的仓库地址）
git remote add origin https://github.com/yourusername/your-repo.git

# 或者使用 SSH（如果你配置了SSH密钥）
git remote add origin git@github.com:yourusername/your-repo.git
```

### 步骤 4: 提交并推送代码

```bash
# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: Hugo blog setup"

# 设置主分支
git branch -M main

# 推送到 GitHub
git push -u origin main
```

### 步骤 5: 启用 GitHub Pages

1. 进入你的 GitHub 仓库
2. 点击 **Settings** > **Pages**
3. 在 **Source** 部分，选择 **GitHub Actions**
4. 等待 GitHub Actions 自动构建和部署（通常需要 1-2 分钟）
5. 部署完成后，访问 `https://yourusername.github.io/your-repo/`

### 步骤 6: 配置自定义域名（可选）

如果你有自定义域名：

1. **在 GitHub 设置域名:**
   - 进入仓库 **Settings** > **Pages**
   - 在 **Custom domain** 输入你的域名（例如：`blog.yourdomain.com`）
   - 勾选 "Enforce HTTPS"

2. **更新配置文件:**
   ```bash
   # 编辑 config.toml，更新 baseURL
   baseURL = 'https://blog.yourdomain.com'
   
   # 编辑 static/CNAME，更新域名
   echo "blog.yourdomain.com" > static/CNAME
   ```

3. **配置 DNS:**
   - 添加 CNAME 记录：`blog` -> `yourusername.github.io`
   - 或者添加 A 记录指向 GitHub Pages IP：
     - `185.199.108.153`
     - `185.199.109.153`
     - `185.199.110.153`
     - `185.199.111.153`

4. **提交更改:**
   ```bash
   git add config.toml static/CNAME
   git commit -m "Configure custom domain"
   git push
   ```

### 步骤 7: 更新博客信息

部署前，记得更新 `config.toml` 中的个人信息：

- `baseURL` - 你的网站地址
- `title` - 博客标题
- `params.author` - 你的名字
- `params.description` - 博客描述

## 🔄 日常更新流程

每次更新博客后：

```bash
# 添加更改
git add .

# 提交
git commit -m "Add new post: 文章标题"

# 推送（会自动触发部署）
git push
```

GitHub Actions 会自动重新构建和部署你的博客。

## ❓ 常见问题

**Q: 部署后看不到网站？**
A: 检查 GitHub Actions 是否有错误，确保工作流成功完成。

**Q: 如何查看部署日志？**
A: 在仓库中点击 **Actions** 标签，查看最新的工作流运行。

**Q: 如何回退到之前的版本？**
A: 使用 Git 回退，然后推送：
```bash
git revert HEAD
git push
```

**Q: 自定义域名不工作？**
A: 检查 DNS 配置是否正确，等待 DNS 传播（可能需要几小时）。

## 📚 更多资源

- [GitHub Pages 文档](https://docs.github.com/en/pages)
- [Hugo 部署指南](https://gohugo.io/hosting-and-deployment/)


