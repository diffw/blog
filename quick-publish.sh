#!/bin/bash

# Super simple publish script — edit a post, then run this script
# Usage: ./quick-publish.sh

echo "🚀 Quick publish blog"
echo ""

# Check for an uncommitted post (new or modified)
UNCOMMITTED=$(git status --porcelain | grep "content/posts/.*\.md$" | head -1)

if [ -z "$UNCOMMITTED" ]; then
    echo "❌ No uncommitted post found"
    echo ""
    echo "💡 Tip:"
    echo "   1. Create a post: hugo new posts/my-post.md"
    echo "   2. Edit the post and set draft: false"
    echo "   3. Then run this script"
    exit 1
fi

# Get filename (handles new '??' and modified 'M')
FILE=$(echo "$UNCOMMITTED" | awk '{print $2}')
FILENAME=$(basename "$FILE" .md)

echo "📄 Found post: $FILE"
echo ""

# Check whether the post is still a draft
if grep -q "draft: true" "$FILE"; then
    echo "⚠️  Warning: post is still a draft (draft: true)"
    read -p "   Automatically set to publish (draft: false)? (y/n) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sed -i '' 's/draft: true/draft: false/' "$FILE"
        echo "✅ Set to publish (draft: false)"
    fi
fi

# Add, commit, and push
echo ""
echo "📤 Publishing..."
git add "$FILE"
git commit -m "Publish: $FILENAME" > /dev/null 2>&1
git push > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "✅ Published successfully!"
    echo ""
    echo "⏱️  Wait 1–2 minutes, then visit: https://nanwang.art"
else
    echo "❌ Publish failed—please check the error output"
    exit 1
fi

