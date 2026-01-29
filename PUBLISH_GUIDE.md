# 📝 Full tutorial: publish a post from the terminal

## Prerequisites

Make sure you:
- have Hugo installed (Extended recommended)
- have pushed this repo to GitHub
- can open a terminal in Cursor

---

## Step 1: Open a terminal in Cursor

- Menu: `Terminal` → `New Terminal`
- Shortcut (Mac): `Ctrl + \`` or `Cmd + J`
- Command palette: `Cmd + Shift + P` → type "Terminal" → "Terminal: Create New Terminal"

---

## Step 2: Go to the project directory

```bash
cd /Users/luke/Cursor/NWA-Blog
```

Tips:
- there must be a space after `cd`
- the path starts with `/Users` (plural)
- press `Tab` to autocomplete

Verify:

```bash
pwd
```

It should print: `/Users/luke/Cursor/NWA-Blog`

---

## Step 3: Create a new post

```bash
hugo new posts/my-awesome-post.md
```

Notes:
- `hugo new` creates new content
- `posts/` is the posts section
- use a lowercase, hyphenated filename for clean URLs

List posts:

```bash
ls content/posts/
```

---

## Step 4: Edit the post

Open the file in Cursor and edit content. In the front matter:
- `draft: true` means not published
- change to `draft: false` to publish

Optional local preview:

```bash
hugo server -D
```

Visit `http://localhost:1313`.

---

## Step 5: Commit and push

```bash
git add content/posts/my-awesome-post.md
git commit -m "Add blog post: My awesome post"
git push
```

---

## Step 6: Confirm deployment

GitHub Actions will rebuild and deploy automatically (usually within 1–2 minutes).

Check:
- Actions: `https://github.com/diffw/blog/actions`
- Site: `https://nanwang.art`

