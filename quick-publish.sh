#!/bin/bash

# 超简单发布脚本 - 只需编辑文件，然后运行此脚本
# 使用方法: ./quick-publish.sh

echo "🚀 快速发布博客"
echo ""

# 检查是否有未提交的文章（包括新文件和修改的文件）
UNCOMMITTED=$(git status --porcelain | grep "content/posts/.*\.md$" | head -1)

if [ -z "$UNCOMMITTED" ]; then
    echo "❌ 没有找到未提交的文章"
    echo ""
    echo "💡 提示:"
    echo "   1. 先创建文章: hugo new posts/文章名.md"
    echo "   2. 编辑文章，设置 draft: false"
    echo "   3. 然后运行此脚本"
    exit 1
fi

# 获取文件名（处理新文件 ?? 和修改的文件 M）
FILE=$(echo "$UNCOMMITTED" | awk '{print $2}')
FILENAME=$(basename "$FILE" .md)

echo "📄 找到文章: $FILE"
echo ""

# 检查是否是草稿
if grep -q "draft: true" "$FILE"; then
    echo "⚠️  警告: 文章还是草稿状态 (draft: true)"
    read -p "   是否自动设置为发布状态? (y/n) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sed -i '' 's/draft: true/draft: false/' "$FILE"
        echo "✅ 已设置为发布状态"
    fi
fi

# 添加、提交、推送
echo ""
echo "📤 正在发布..."
git add "$FILE"
git commit -m "Publish: $FILENAME" > /dev/null 2>&1
git push > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "✅ 发布成功！"
    echo ""
    echo "⏱️  等待 1-2 分钟，然后访问: https://nanwang.art"
else
    echo "❌ 发布失败，请检查错误信息"
    exit 1
fi

