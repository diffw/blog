#!/bin/bash

# 一键发布博客文章脚本
# 使用方法: ./publish.sh "文章标题"

# 检查参数
if [ -z "$1" ]; then
    echo "❌ 错误: 请提供文章标题"
    echo ""
    echo "使用方法:"
    echo "  ./publish.sh \"我的文章标题\""
    echo ""
    echo "或者:"
    echo "  ./publish.sh my-article-title"
    exit 1
fi

# 获取文章标题
TITLE="$1"
# 将标题转换为文件名（小写，空格替换为横线）
FILENAME=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -d '[:punct:]')
FILENAME="${FILENAME}.md"

echo "🚀 开始发布文章: $TITLE"
echo "📄 文件名: $FILENAME"
echo ""

# 1. 创建文章
echo "📝 步骤 1/5: 创建文章..."
hugo new posts/"$FILENAME" > /dev/null 2>&1

if [ ! -f "content/posts/$FILENAME" ]; then
    echo "❌ 创建文章失败"
    exit 1
fi

echo "✅ 文章已创建: content/posts/$FILENAME"
echo ""

# 2. 自动设置 draft: false
echo "📝 步骤 2/5: 设置文章为发布状态..."
sed -i '' 's/draft: true/draft: false/' "content/posts/$FILENAME"
echo "✅ 已设置 draft: false"
echo ""

# 3. 提示用户编辑
echo "📝 步骤 3/5: 请编辑文章内容..."
echo "   文件位置: content/posts/$FILENAME"
echo ""
read -p "   编辑完成后，按 Enter 继续..."
echo ""

# 4. 添加到 Git
echo "📝 步骤 4/5: 添加到 Git..."
git add "content/posts/$FILENAME"
echo "✅ 已添加到 Git"
echo ""

# 5. 提交并推送
echo "📝 步骤 5/5: 提交并推送到 GitHub..."
git commit -m "Add new post: $TITLE" > /dev/null 2>&1
git push > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "✅ 已推送到 GitHub"
    echo ""
    echo "🎉 发布完成！"
    echo ""
    echo "📋 下一步:"
    echo "   1. 等待 1-2 分钟让 GitHub Actions 部署"
    echo "   2. 查看部署状态: https://github.com/diffw/blog/actions"
    echo "   3. 访问博客: https://nanwang.art"
    echo ""
else
    echo "❌ 推送失败，请检查 Git 配置"
    exit 1
fi

