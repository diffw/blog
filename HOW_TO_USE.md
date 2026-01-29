# Blog usage guide

## 1. Create and publish posts

### Option 1: Use Hugo (recommended)

```bash
# From the project root
hugo new posts/my-article-name.md
```

This creates `content/posts/my-article-name.md` with default front matter.

### Option 2: Create manually

Create a new Markdown file under `content/posts/`.

### Post template

```markdown
---
title: "Post title"
date: 2025-11-27T10:00:00+08:00
draft: false
categories: ["Design", "Life"]
tags: ["tag1", "tag2"]
description: "Post description (used for SEO and homepage summaries)"
---

# Post title

Write your post content here...
```

### Publish steps

1. Create the post
2. Edit content and set `draft: false`
3. Preview locally (optional):

```bash
hugo server -D   # include drafts
# or
hugo server      # published only
```

Visit `http://localhost:1313`.

4. Push to GitHub:

```bash
git add content/posts/my-article-name.md
git commit -m "Add blog post: my-article-name"
git push
```

GitHub Actions will deploy automatically.

### Front matter fields

- `title`: post title
- `date`: publish datetime (e.g. `YYYY-MM-DDTHH:MM:SS+08:00`)
- `draft`: `true` = draft, `false` = published
- `categories`: array of broad categories
- `tags`: array of tags
- `description`: short description for SEO and summaries

---

## 2. Themes

This repo uses the custom theme under `themes/modern-blog/`.

### Option 1: Add a third-party theme as a Git submodule (recommended)

```bash
git submodule add https://github.com/theme-author/theme-name.git themes/theme-name

# Update config.toml:
# theme = "theme-name"

git add .gitmodules config.toml
git commit -m "Add theme: theme-name"
git push
```

### Option 2: Clone directly (not recommended for committing)

```bash
cd themes
git clone https://github.com/theme-author/theme-name.git
```

Then set `theme = "theme-name"` in `config.toml`.

---

## 3. Useful commands

```bash
# Preview (including drafts)
hugo server -D

# Build
hugo

# Check repo status
git status
```

