# Deployment Guide

## Local development

### 1. Install Hugo

Install Hugo **Extended** (required for SCSS):

**macOS:**
```bash
brew install hugo
```

**Other platforms:**
See `https://gohugo.io/installation/`

### 2. Start the dev server

```bash
hugo server -D
```

Visit `http://localhost:1313`

### 3. Create a new post

```bash
hugo new posts/my-new-post.md
```

Edit `content/posts/my-new-post.md`, then change `draft: true` to `draft: false` when ready to publish.

## Deploy to GitHub Pages

### 1. Repository setup

1. Create a new repository on GitHub
2. Push the code:
```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/yourusername/your-repo.git
git push -u origin main
```

### 2. Configure GitHub Pages

1. Go to **Settings > Pages**
2. Set **Source** to **GitHub Actions**
3. The workflow will build and deploy automatically

### 3. Configure a custom domain

1. Set your domain in `static/CNAME`
2. Update `baseURL` in `config.toml` to your domain
3. Add A records in your DNS:
   - Type: A
   - Host: @
   - Value: GitHub Pages IPs (commonly `185.199.108.153`, `185.199.109.153`, `185.199.110.153`, `185.199.111.153`)
4. Optionally add a CNAME record pointing to `yourusername.github.io`

### 4. Update configuration

Edit `config.toml`:
- Update `baseURL` to your domain
- Update `title` to your site title
- Update `params.author` to your name
- Update social links (if needed)

## Features

### Search
- Click the search icon (top right)
- Full-text search across titles and content
- Results update in real time

### Dark mode
- Click the theme toggle (top right)
- Preference is saved locally

### RSS
- Visit `/index.xml` for the RSS feed
- RSS link is available in the footer

### SEO
- Automatic `sitemap.xml`
- Full meta tags
- Open Graph and Twitter Card support
- `robots.txt` configuration

## Directory structure

```
.
├── config.toml          # config
├── content/             # content
│   ├── posts/          # posts
│   └── about.md        # about page
├── themes/             # theme(s)
│   └── modern-blog/    # custom theme
├── static/             # static files
├── .github/            # GitHub Actions config
└── README.md           # documentation
```

## Troubleshooting

### Search doesn't work?
Ensure `params.searchEnabled = true` in `config.toml`, and that `index.json` is generated during build.

### Dark mode doesn't toggle?
Check the browser console for JavaScript errors.

### Styles missing after deployment?
Ensure you use Hugo Extended and GitHub Actions uses `extended: true`.


