# Personal Blog

A modern, minimalist personal blog built with Hugo. Includes dark mode, full-text search, RSS, and SEO.

## ✨ Features

- 🎨 **Modern, clean design** - crisp UI and elegant typography
- 🌙 **Dark mode** - light/dark theme toggle
- 📱 **Fully responsive** - works great on desktop, tablet, and mobile
- 🔍 **Full-text search** - search post titles and content
- 📡 **RSS** - RSS feed support
- 🏷️ **Categories & tags** - flexible taxonomy
- ⚡ **Fast loading** - performance-optimized
- 🔎 **SEO** - sitemap, meta tags, Open Graph/Twitter cards, and robots.txt

## 🚀 Quickstart

### 1. Install Hugo

Install **Hugo Extended** (required for asset processing):

**macOS:**
```bash
brew install hugo
```

**Other platforms:**
See the [Hugo installation guide](https://gohugo.io/installation/)

### 2. Local development

```bash
# Start the dev server
hugo server -D

# Visit http://localhost:1313
```

### 3. Create a new post

```bash
# Create with Hugo
hugo new posts/my-new-post.md

# Or create a Markdown file directly under content/posts/
```

After editing, set `draft: true` to `draft: false` in the front matter.

## 📝 Configure the site

Edit `config.toml` to configure the site:

- `baseURL` - your site URL
- `title` - site title
- `params.author` - author name
- `params.description` - site description
- `params.darkMode` - enable dark mode (default: true)
- `params.searchEnabled` - enable search (default: true)

## 🚢 Deploy to GitHub Pages

See [DEPLOYMENT.md](./DEPLOYMENT.md) for a detailed guide.

### Quick deployment steps

1. Create a GitHub repository and push the code
2. In **Settings > Pages**, set **Source** to **GitHub Actions**
3. The workflow will build and deploy automatically
4. Configure a custom domain (optional)

## 📁 Project structure

```
.
├── config.toml          # main config
├── content/             # content
│   ├── posts/          # posts
│   └── about.md        # about page
├── themes/             # theme(s)
│   └── modern-blog/    # custom theme
├── static/             # static files (robots.txt, CNAME, etc.)
├── .github/            # GitHub Actions workflows
└── README.md           # documentation
```

## 🎨 Usage notes

### Post front matter

Example front matter:

```yaml
---
title: "Post title"
date: 2024-01-01T10:00:00+08:00
draft: false
categories: ["Design", "Life"]
tags: ["Blog", "Share"]
description: "Post description (used for SEO and summaries)"
---
```

### Categories and tags

- **categories**: broader grouping (e.g. "Design", "Life")
- **tags**: more granular labels

### Search

- Click the search icon (top right) to open search
- Type to search in real time
- Searches both titles and content

### Dark mode

- Use the theme toggle (top right)
- Preferences are saved locally

## 📚 More

- [Hugo documentation](https://gohugo.io/documentation/)
- [Deployment guide](./DEPLOYMENT.md)

## 📄 License

MIT License

