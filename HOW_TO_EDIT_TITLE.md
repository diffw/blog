# 📝 How to change a post title

## Method 1: Edit the file directly (easiest)

### Steps

1. **Open the post file**
   - Find the post in Cursor's file explorer
   - Example: `content/posts/11-28-2025.md`
   - Click to open

2. **Edit the title**
   - Find the front matter at the top (YAML)
   - Update the `title` field:

   ```markdown
   ---
   title: "New title"    ← change this
   date: 2025-11-28T...
   draft: false
   ...
   ---
   ```

3. **Save the file**
   - Press `Cmd + S` (Mac) or `Ctrl + S` (Windows/Linux)

4. **Commit and push**
   ```bash
   git add content/posts/filename.md
   git commit -m "Update post title: New title"
   git push
   ```

   **Or use the quick publish script:**
   ```bash
   ./quick-publish.sh
   ```

---

## Method 2: Use terminal commands (batch)

### Use `sed`

```bash
# Edit a single file
sed -i '' 's/title: "Old title"/title: "New title"/' content/posts/filename.md

# Example: change "Thanksgiving 2025" to "Thanksgiving Day 2025"
sed -i '' 's/title: "Thanksgiving 2025"/title: "Thanksgiving Day 2025"/' content/posts/11-27-2025.md
```

### Use `nano`

```bash
nano content/posts/filename.md
# After editing: Ctrl+X, then Y, then Enter to save
```

### Use `vim`

```bash
vim content/posts/filename.md
# Press i to enter insert mode
# Edit the title
# Press Esc, then type :wq to save and quit
```

---

## Method 3: Use a script (batch multiple files)

### Create a title-update script

```bash
#!/bin/bash
# Post title update script

FILE="content/posts/filename.md"
OLD_TITLE="Old title"
NEW_TITLE="New title"

sed -i '' "s/title: \"$OLD_TITLE\"/title: \"$NEW_TITLE\"/" "$FILE"
echo "✅ Updated: $FILE"
```

---

## Full example

### Example: change the title in `11-28-2025.md`

**Current:**
```markdown
---
title: "Current Title"
date: 2025-11-28T...
---
```

**Steps:**

1. Open `content/posts/11-28-2025.md`

2. Change to:
   ```markdown
   ---
   title: "New Title"    ← update the title
   date: 2025-11-28T...
   ---
   ```

3. Save the file

4. Commit the change:
   ```bash
   git add content/posts/11-28-2025.md
   git commit -m "Update title: New Title"
   git push
   ```

---

## Important notes

### ⚠️ Things to watch for

1. **Only change the `title` in the front matter**
   - Don't change any title inside the body (if present)
   - The theme uses the front matter `title`

2. **The URL will not change automatically**
   - Changing `title` does not change the URL
   - The URL is based on the filename, not the title
   - To change the URL, rename the file

3. **Use clear commit messages**
   - Use a meaningful message
   - Example: `git commit -m "Update title: New title"`

---

## If you need to change both filename and title

### Steps

1. **Rename the file**
   ```bash
   git mv content/posts/old-filename.md content/posts/new-filename.md
   ```

2. **Update the title**
   - Edit the file and update the front matter `title`

3. **Commit**
   ```bash
   git add content/posts/new-filename.md
   git commit -m "Rename post and update title"
   git push
   ```

---

## Quick reference

### Easiest flow

```bash
# 1. Edit the file in Cursor and change title

# 2. Commit and push
git add content/posts/filename.md
git commit -m "Update title"
git push
```

### Or use the quick publish script

```bash
# After editing
./quick-publish.sh
```

---

## Summary

**Recommended:**
1. Edit the file in Cursor
2. Update the front matter `title`
3. Save
4. Use `./quick-publish.sh` or commit/push manually

That's it! 🎉


