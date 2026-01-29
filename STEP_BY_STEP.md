# 📝 Step-by-step: publish a blog post

## Full flow (4 steps)

---

## ✅ Step 1: Open a terminal

In Cursor:
- Shortcut: `Ctrl + \`` (Control + backtick)
- Or menu: `Terminal` → `New Terminal`

You should see a prompt similar to:

```text
luke@Lukes-MacBook-Pro NWA-Blog %
```

If you are not in the project directory, run:

```bash
cd /Users/luke/Cursor/NWA-Blog
```

---

## ✅ Step 2: Create a post

```bash
hugo new posts/today-article.md
```

Notes:
- Replace `today-article` with your own slug
- Prefer lowercase with hyphens, e.g. `my-first-post.md`, `design-thoughts.md`

If successful, Hugo prints something like:

```text
Content "content/posts/today-article.md" created
```

---

## ✅ Step 3: Edit the post (important)

Open `content/posts/today-article.md` and update:
- write your content
- set `draft: false` when ready to publish

Optional: preview locally

```bash
hugo server -D
```

Visit `http://localhost:1313` and press `Ctrl+C` to stop.

---

## ✅ Step 4: Commit and push

```bash
git add content/posts/today-article.md
git commit -m "Add blog post: Today article"
git push
```

After ~1–2 minutes, GitHub Actions should deploy the site.

