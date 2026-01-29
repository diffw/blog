# 🚀 Simplified Publishing

## Method 1: Use the one-click scripts (easiest)

### Full flow (create + publish)

```bash
./publish.sh "My post title"
```

**That's it.** The script will automatically:
1. ✅ create the post
2. ✅ set `draft: false`
3. ✅ prompt you to edit content
4. ✅ commit to Git
5. ✅ push to GitHub

### Quick publish (publish an already-edited post)

```bash
# 1. Create and edit the post
hugo new posts/my-article.md
# Edit in Cursor and set draft: false

# 2. One-click publish
./quick-publish.sh
```

---

## Method 2: Minimal manual flow (3 steps)

### Step 1: Create the post
```bash
hugo new posts/my-post.md
```

### Step 2: Edit the post
Open the file in Cursor, write content, and **set `draft: false`**.

### Step 3: Publish
```bash
git add content/posts/my-post.md && git commit -m "Add post" && git push
```

**Done.**

---

## Method 3: Use a Git alias (fastest)

### Set up the alias (one-time)

```bash
git config --global alias.publish '!f() { git add "$1" && git commit -m "Publish: $(basename "$1" .md)" && git push; }; f'
```

### Publish using the alias

```bash
# After creating and editing the post
git publish content/posts/my-post.md
```

---

## Comparison: original vs simplified

### Original flow (6 steps)
1. `cd /Users/luke/Cursor/NWA-Blog`
2. `hugo new posts/my-post.md`
3. Edit the file
4. `git add content/posts/my-post.md`
5. `git commit -m "Add post"`
6. `git push`

### Simplified flow (1 step)
```bash
./publish.sh "Post title"
```

Or (3 steps)
```bash
hugo new posts/my-post.md
# Edit the file
git add content/posts/my-post.md && git commit -m "Add post" && git push
```

---

## Recommended workflow

### Daily writing workflow

1. **Create the post**
   ```bash
   hugo new posts/today-article.md
   ```

2. **Edit content**
   - Open the file in Cursor
   - Write the content
   - Set `draft: false`

3. **One-click publish**
   ```bash
   ./quick-publish.sh
   ```

**Total time: ~2 minutes** ⚡

---

## Tips

- Local preview (optional): `hugo server -D`
- Check status: `git status`
- Undo changes: `git restore content/posts/my-post.md`

---

## Summary

**Easiest:**
```bash
./publish.sh "Post title"
```

**Fastest:**
```bash
hugo new posts/name.md && # edit the file
./quick-publish.sh
```

That's it! 🎉


