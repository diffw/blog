# 🚀 GitHub Pages Deployment Steps

## Quick deployment guide

### Step 1: Prepare the code

All files are ready and the Git repository is initialized.

### Step 2: Create a GitHub repository

1. Visit https://github.com/new
2. Enter a repository name (e.g. `my-blog`)
3. Do **not** check "Initialize this repository with a README"
4. Click "Create repository"

### Step 3: Connect your local repo to GitHub

```bash
# Add remote (replace with your repo URL)
git remote add origin https://github.com/yourusername/your-repo.git

# Or use SSH (if you've set up SSH keys)
git remote add origin git@github.com:yourusername/your-repo.git
```

### Step 4: Commit and push

```bash
# Add all files
git add .

# Commit
git commit -m "Initial commit: Hugo blog setup"

# Set main branch
git branch -M main

# Push to GitHub
git push -u origin main
```

### Step 5: Enable GitHub Pages

1. Open your GitHub repository
2. Click **Settings** > **Pages**
3. Under **Source**, choose **GitHub Actions**
4. Wait for GitHub Actions to build and deploy (usually 1–2 minutes)
5. After deployment, visit `https://yourusername.github.io/your-repo/`

### Step 6: Configure a custom domain (optional)

If you have a custom domain:

1. **Set the domain in GitHub:**
   - Go to **Settings** > **Pages**
   - Enter your domain under **Custom domain** (e.g. `blog.yourdomain.com`)
   - Enable "Enforce HTTPS"

2. **Update configuration:**
   ```bash
   # Edit config.toml and update baseURL
   baseURL = 'https://blog.yourdomain.com'
   
   # Edit static/CNAME and update the domain
   echo "blog.yourdomain.com" > static/CNAME
   ```

3. **Configure DNS:**
   - Add a CNAME record: `blog` -> `yourusername.github.io`
   - Or add A records pointing to GitHub Pages IPs:
     - `185.199.108.153`
     - `185.199.109.153`
     - `185.199.110.153`
     - `185.199.111.153`

4. **Commit changes:**
   ```bash
   git add config.toml static/CNAME
   git commit -m "Configure custom domain"
   git push
   ```

### Step 7: Update site information

Before deploying, update your info in `config.toml`:

- `baseURL` - your site URL
- `title` - site title
- `params.author` - your name
- `params.description` - site description

## 🔄 Daily update flow

After each update:

```bash
# Stage changes
git add .

# Commit
git commit -m "Add new post: Post title"

# Push (triggers deployment)
git push
```

GitHub Actions will rebuild and deploy automatically.

## ❓ FAQ

**Q: Can't see the site after deployment?**
A: Check GitHub Actions for errors and make sure the workflow completed successfully.

**Q: How do I view deployment logs?**
A: Open the **Actions** tab and view the latest workflow run.

**Q: How do I roll back to a previous version?**
A: Use Git revert and push:
```bash
git revert HEAD
git push
```

**Q: Custom domain doesn't work?**
A: Verify DNS settings and wait for propagation (can take hours).

## 📚 Resources

- [GitHub Pages docs](https://docs.github.com/en/pages)
- [Hugo hosting & deployment](https://gohugo.io/hosting-and-deployment/)


