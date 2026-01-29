#!/bin/bash

# One-click blog post publishing script
# Usage: ./publish.sh "Post title"

# Validate arguments
if [ -z "$1" ]; then
    echo "❌ Error: please provide a post title"
    echo ""
    echo "Usage:"
    echo "  ./publish.sh \"My post title\""
    echo ""
    echo "Or:"
    echo "  ./publish.sh my-article-title"
    exit 1
fi

# Read title argument
TITLE="$1"
# Convert title to filename (lowercase, spaces to hyphens)
FILENAME=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -d '[:punct:]')
FILENAME="${FILENAME}.md"

echo "🚀 Starting publish: $TITLE"
echo "📄 Filename: $FILENAME"
echo ""

# 1) Create post
echo "📝 Step 1/5: Creating post..."
hugo new posts/"$FILENAME" > /dev/null 2>&1

if [ ! -f "content/posts/$FILENAME" ]; then
    echo "❌ Failed to create post"
    exit 1
fi

echo "✅ Post created: content/posts/$FILENAME"
echo ""

# 2) Automatically set draft: false
echo "📝 Step 2/5: Setting post to published..."
sed -i '' 's/draft: true/draft: false/' "content/posts/$FILENAME"
echo "✅ Set draft: false"
echo ""

# 3) Prompt user to edit
echo "📝 Step 3/5: Please edit the post content..."
echo "   File: content/posts/$FILENAME"
echo ""
read -p "   Press Enter to continue..."
echo ""

# 4) Add to Git
echo "📝 Step 4/5: Adding to Git..."
git add "content/posts/$FILENAME"
echo "✅ Added to Git"
echo ""

# 5) Commit and push
echo "📝 Step 5/5: Committing and pushing to GitHub..."
git commit -m "Add new post: $TITLE" > /dev/null 2>&1
git push > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "✅ Pushed to GitHub"
    echo ""
    echo "🎉 Publish complete!"
    echo ""
    echo "📋 Next steps:"
    echo "   1. Wait 1–2 minutes for GitHub Actions to deploy"
    echo "   2. Check status: https://github.com/diffw/blog/actions"
    echo "   3. Visit: https://nanwang.art"
    echo ""
else
    echo "❌ Push failed—please check your Git configuration"
    exit 1
fi

