#!/bin/bash

# GitHub Pages deployment prep script

echo "🚀 Preparing to deploy to GitHub Pages..."
echo ""

# Ensure we're inside a Git repo
if [ ! -d ".git" ]; then
    echo "❌ Error: current directory is not a Git repository"
    echo "   Please run: git init"
    exit 1
fi

# Add all files
echo "📦 Adding files to Git..."
git add .

# Check for staged changes
if git diff --staged --quiet; then
    echo "ℹ️  No changes to commit"
else
    echo "💾 Committing changes..."
    git commit -m "Initial commit: Hugo blog setup"
    echo "✅ Changes committed"
fi

echo ""
echo "📋 Next steps:"
echo ""
echo "1. Create a new repository on GitHub (if you haven't already)"
echo "2. Add the remote repository:"
echo "   git remote add origin https://github.com/yourusername/your-repo.git"
echo ""
echo "3. Push to GitHub:"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "4. In the repo Settings > Pages:"
echo "   - Set Source to 'GitHub Actions'"
echo "   - Wait for the deployment to finish"
echo ""
echo "5. Configure a custom domain (optional):"
echo "   - Set Custom domain in Settings > Pages"
echo "   - Update baseURL in config.toml"
echo "   - Update static/CNAME"
echo ""


