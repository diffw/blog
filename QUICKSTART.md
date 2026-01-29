# Quickstart Guide

## 📋 Next steps

### 1️⃣ Install Hugo (if needed)

**macOS:**
```bash
brew install hugo
```

**Verify installation:**
```bash
hugo version
```
Make sure you have the **Extended** version (required for asset processing).

### 2️⃣ Configure your site

Edit `config.toml` and update:

- **baseURL**: your domain (e.g. `https://yourdomain.com`)
- **title**: your site title
- **params.author**: your name
- **params.description**: site description
- **params.keywords**: keywords (comma-separated)
- **params.github/twitter/email**: social links (optional)

### 3️⃣ Configure a custom domain (optional)

Edit `static/CNAME` and replace `yourdomain.com` with your real domain.

### 4️⃣ Test locally

```bash
# From the project root
hugo server -D

# Visit http://localhost:1313
```

Press `Ctrl+C` to stop the server.

### 5️⃣ Create your first post

**Option 1: Use Hugo**
```bash
hugo new posts/my-first-post.md
```

**Option 2: Create manually**
Create a new Markdown file under `content/posts/`.

**Post template:**
```markdown
---
title: "Post title"
date: 2024-01-01T10:00:00+08:00
draft: false
categories: ["Design", "Life"]
tags: ["tag1", "tag2"]
description: "Post description"
---

# Post title

Write your post content here...
```

### 6️⃣ Deploy to GitHub Pages

#### Step A: Create a GitHub repository

1. Create a new repository on GitHub (e.g. `my-blog`)
2. Do **not** initialize with README, .gitignore, or license

#### Step B: Initialize Git and push

```bash
# Initialize Git (if needed)
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit: Hugo blog setup"

# Add remote (replace with your repo URL)
git remote add origin https://github.com/yourusername/your-repo.git

# Push to GitHub
git branch -M main
git push -u origin main
```

#### Step C: Enable GitHub Pages

1. Go to **Settings** > **Pages**
2. Under **Source**, choose **GitHub Actions**
3. Wait for GitHub Actions to build and deploy (usually 1–2 minutes)
4. After deployment, visit `https://yourusername.github.io/your-repo/`

#### Step D: Custom domain (optional)

1. In **Settings** > **Pages**, enter your domain under **Custom domain**
2. Add A records in your DNS:
   - Type: A
   - Host: @
   - Value: `185.199.108.153`, `185.199.109.153`, `185.199.110.153`, `185.199.111.153`
3. Wait for DNS propagation (minutes to hours)

### 7️⃣ Daily usage

#### Create a new post
```bash
hugo new posts/article-name.md
```

#### Preview locally (including drafts)
```bash
hugo server -D
```

#### Preview locally (published only)
```bash
hugo server
```

#### Build the site
```bash
hugo
```
Output is in `public/`.

#### Push updates to GitHub
```bash
git add .
git commit -m "Add new post: article name"
git push
```
GitHub Actions will redeploy automatically.

## 🎯 Checklist

- [ ] Install Hugo Extended
- [ ] Update your info in `config.toml`
- [ ] Test locally (`hugo server -D`)
- [ ] Create your first post
- [ ] Create a GitHub repo
- [ ] Push code to GitHub
- [ ] Enable GitHub Pages
- [ ] Configure a custom domain (if needed)
- [ ] Start writing!

## ❓ FAQ

**Q: Search doesn't work?**
A: Ensure `params.searchEnabled = true` in `config.toml` and that `index.json` is generated during build.

**Q: Dark mode doesn't toggle?**
A: Check the browser console for JavaScript errors and ensure `params.darkMode = true`.

**Q: Styles missing after deployment?**
A: Ensure you use Hugo Extended and GitHub Actions is configured with `extended: true`.

**Q: How do I customize theme styles?**
A: Edit `themes/modern-blog/assets/css/main.css`.

## 📚 More help

- [Hugo documentation](https://gohugo.io/documentation/)
- [Deployment guide](./DEPLOYMENT.md)
- [Project README](./README.md)


