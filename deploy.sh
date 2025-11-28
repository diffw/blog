#!/bin/bash

# GitHub Pages 部署准备脚本

echo "🚀 准备部署到 GitHub Pages..."
echo ""

# 检查是否在Git仓库中
if [ ! -d ".git" ]; then
    echo "❌ 错误: 当前目录不是Git仓库"
    echo "   请先运行: git init"
    exit 1
fi

# 添加所有文件
echo "📦 添加文件到Git..."
git add .

# 检查是否有更改
if git diff --staged --quiet; then
    echo "ℹ️  没有需要提交的更改"
else
    echo "💾 提交更改..."
    git commit -m "Initial commit: Hugo blog setup"
    echo "✅ 已提交更改"
fi

echo ""
echo "📋 接下来的步骤:"
echo ""
echo "1. 在 GitHub 上创建新仓库（如果还没有）"
echo "2. 添加远程仓库:"
echo "   git remote add origin https://github.com/yourusername/your-repo.git"
echo ""
echo "3. 推送到 GitHub:"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "4. 在仓库 Settings > Pages 中:"
echo "   - Source 选择 'GitHub Actions'"
echo "   - 等待自动部署完成"
echo ""
echo "5. 配置自定义域名（可选）:"
echo "   - 在 Settings > Pages 中设置 Custom domain"
echo "   - 更新 config.toml 中的 baseURL"
echo "   - 更新 static/CNAME 文件"
echo ""

