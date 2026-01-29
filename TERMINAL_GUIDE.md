# Terminal Operations Guide

This guide walks you through common terminal workflows for publishing and removing content on this blog.

---

## 📝 1. Publish a post

### Step 1: Create a new post

```bash
# From the project root
hugo new posts/my-post.md
```

This creates a new file under `content/posts/`.

### Step 2: Edit the post

Open and edit the file with your editor:

```bash
# Cursor / VS Code
code content/posts/my-post.md

# Or other editors
nano content/posts/my-post.md
vim content/posts/my-post.md
```

**Important:** Make sure the front matter is set to `draft: false` when you want it published.

### Step 3: Commit and push

```bash
git add content/posts/my-post.md
git commit -m "Publish: my-post"
git push
```

### Step 4: Wait for deployment

Wait ~1–2 minutes for GitHub Actions to build and deploy, then visit:
- `https://nanwang.art/posts/`

---

## 🗑️ 2. Delete one or more posts (and update the site)

### Step 1: Delete files

```bash
# Delete a single file
rm content/posts/my-post.md

# Delete multiple files
rm content/posts/post-1.md content/posts/post-2.md

# Or use a glob (use with care)
rm content/posts/to-delete-*.md
```

### Step 2: Stage deletions

```bash
# Option 1: stage all changes (including deletions)
git add -A

# Option 2: stage tracked-file changes only (including deletions)
git add -u
```

### Step 3: Commit and push

```bash
git commit -m "Remove deleted posts"
git push
```

### Step 4: Wait for deployment

Wait ~1–2 minutes; the site will update and deleted posts will disappear.

---

## 📄 3. Publish a page

### Step 1: Create a new page

```bash
# Create directly under content/
touch content/now.md
code content/now.md
```

### Step 2: Add front matter and content

```markdown
---
title: "Page title"
date: 2025-11-28T12:00:00-06:00
draft: false
---

Page content goes here...
```

### Step 3: Commit and push

```bash
git add content/now.md
git commit -m "Add page: now"
git push
```

### Step 4: Visit the page

After ~1–2 minutes, visit:
- `https://nanwang.art/now/`

Note: pages do not appear in the homepage posts list; you visit them by URL.

---

## 🗑️ 4. Delete one or more pages

```bash
rm content/page-to-delete.md
git add -A
git commit -m "Remove deleted pages"
git push
```

---

## 🔍 Common Git commands

### Status

```bash
git status
git status --short
```

### Diffs

```bash
git diff
git diff --staged
```

### Undo changes

```bash
# Discard working tree changes (not added)
git checkout -- path/to/file

# Unstage (added but not committed)
git reset HEAD path/to/file

# Undo last commit (keep changes)
git reset --soft HEAD~1
```

### History

```bash
git log --oneline
git log --oneline -5
```

---

## ⚡ Quick publish script

If you publish often, you can use:

```bash
./quick-publish.sh
```

It will:
- detect an uncommitted post under `content/posts/`
- optionally flip `draft: true` → `draft: false`
- commit and push

---

## 📋 Summary

### Post vs Page

| Feature | Post | Page |
|---|---|---|
| Location | `content/posts/` | `content/` |
| Appears on homepage | Yes | No |
| Appears under `/posts/` | Yes | No |
| URL pattern | `/posts/<slug>/` | `/<slug>/` |
| Purpose | Blog entry | Standalone page (e.g. About, Now) |

### Generic workflow

Create/edit → `git add` → `git commit` → `git push` → wait for deploy

---

## 🆘 Need help?

1. Run `git status` to see what changed
2. Check GitHub Actions logs: `https://github.com/diffw/blog/actions`
3. Try a local build: `hugo --minify`

