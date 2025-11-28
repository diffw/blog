# 📝 完整教程：如何在终端中发布一篇博客

## 前置条件

确保你已经：
- ✅ 安装了 Hugo
- ✅ 项目已经推送到 GitHub
- ✅ 知道如何打开终端

---

## 第一步：打开终端

### 在 Cursor 中打开终端

1. 方法 1：菜单栏
   - 点击顶部菜单 `Terminal` → `New Terminal`

2. 方法 2：快捷键
   - Mac: `Ctrl + \`` (Control + 反引号)
   - 或 `Cmd + J`

3. 方法 3：命令面板
   - `Cmd + Shift + P` → 输入 "Terminal" → 选择 "Terminal: Create New Terminal"

---

## 第二步：进入项目目录

### 在终端中输入：

```bash
cd /Users/luke/Cursor/NWA-Blog
```

**重要提示：**
- `cd` 和路径之间**必须有空格**
- 路径是 `/Users`（复数），不是 `/User`
- 可以使用 `Tab` 键自动补全路径

### 验证是否在正确目录：

```bash
pwd
```

应该显示：`/Users/luke/Cursor/NWA-Blog`

---

## 第三步：创建新文章

### 使用 Hugo 命令创建文章：

```bash
hugo new posts/我的文章标题.md
```

**说明：**
- `hugo new` - Hugo 创建新内容的命令
- `posts/` - 文章存放的目录
- `我的文章标题.md` - 文件名（可以用英文或中文，建议用英文）

**示例：**
```bash
hugo new posts/my-awesome-post.md
```

### 查看创建的文件：

```bash
ls content/posts/
```

应该能看到新创建的文件。

---

## 第四步：编辑文章内容

### 方法 1：在 Cursor 中编辑（推荐）

1. 在左侧文件浏览器中找到：`content/posts/我的文章标题.md`
2. 点击打开文件
3. 编辑内容

### 方法 2：使用终端编辑器

```bash
# 使用 nano 编辑器（简单）
nano content/posts/我的文章标题.md

# 或使用 vim（高级）
vim content/posts/我的文章标题.md
```

### 文章模板示例：

```markdown
---
title: "我的文章标题"
date: 2025-11-27T21:30:00+08:00
draft: false
categories: ["设计", "生活"]
tags: ["博客", "分享"]
description: "这是文章的简短描述"
---

# 我的文章标题

这里是文章的开头段落...

## 二级标题

更多内容...

### 三级标题

列表示例：
- 项目 1
- 项目 2
- 项目 3

**加粗文字** 和 *斜体文字*

[链接示例](https://example.com)
```

### 重要配置说明：

- `draft: false` - **必须改为 false 才能发布**（默认是 true）
- `title` - 文章标题
- `categories` - 分类（数组格式）
- `tags` - 标签（数组格式）
- `description` - 文章描述（用于 SEO 和首页摘要）

---

## 第五步：本地预览（可选但推荐）

### 启动 Hugo 开发服务器：

```bash
hugo server -D
```

**说明：**
- `-D` 参数表示包含草稿（draft: true 的文章也会显示）

### 查看输出：

终端会显示类似信息：
```
Web Server is available at http://localhost:1313/
```

### 在浏览器中查看：

1. 打开浏览器
2. 访问：`http://localhost:1313`
3. 找到你的文章并检查

### 停止服务器：

按 `Ctrl + C` 停止服务器

---

## 第六步：提交更改到 Git

### 6.1 查看更改状态：

```bash
git status
```

会显示哪些文件被修改了。

### 6.2 添加文件到暂存区：

```bash
git add content/posts/我的文章标题.md
```

**或者添加所有更改：**
```bash
git add .
```

### 6.3 提交更改：

```bash
git commit -m "Add new post: 我的文章标题"
```

**说明：**
- `-m` 后面是提交信息，描述你做了什么
- 建议使用有意义的提交信息

---

## 第七步：推送到 GitHub

### 推送代码：

```bash
git push
```

**说明：**
- 这会把你本地的更改推送到 GitHub
- GitHub Actions 会自动构建和部署你的博客

### 如果提示需要认证：

可能需要输入 GitHub 用户名和密码（或使用 Personal Access Token）

---

## 第八步：等待部署完成

### 查看部署状态：

1. 打开浏览器
2. 访问：https://github.com/diffw/blog/actions
3. 查看最新的工作流运行状态

### 部署完成后：

1. 等待 1-2 分钟
2. 访问你的博客：https://blog.nanwang.art
3. 找到你的新文章！

---

## 完整命令序列示例

```bash
# 1. 进入项目目录
cd /Users/luke/Cursor/NWA-Blog

# 2. 创建新文章
hugo new posts/my-new-post.md

# 3. 编辑文章（在 Cursor 中打开文件编辑）
# content/posts/my-new-post.md

# 4. 本地预览（可选）
hugo server -D
# 在浏览器访问 http://localhost:1313
# 按 Ctrl+C 停止服务器

# 5. 添加文件
git add content/posts/my-new-post.md

# 6. 提交
git commit -m "Add new post: my-new-post"

# 7. 推送
git push

# 8. 等待部署完成，访问博客查看
```

---

## 常见问题解决

### 问题 1: "command not found: hugo"

**解决：**
```bash
# 检查 Hugo 是否安装
hugo version

# 如果未安装，Mac 上使用：
brew install hugo
```

### 问题 2: "cd: No such file or directory"

**解决：**
- 检查路径是否正确
- 确保 `cd` 和路径之间有空格
- 使用 `pwd` 查看当前目录

### 问题 3: 文章在网站上不显示

**检查：**
1. 确认 `draft: false`（不是 `true`）
2. 检查 GitHub Actions 是否成功部署
3. 清除浏览器缓存后刷新

### 问题 4: Git push 失败

**可能原因：**
- 需要先 pull 远程更改
- 认证问题

**解决：**
```bash
# 先拉取远程更改
git pull

# 然后再推送
git push
```

---

## 快速参考命令

```bash
# 创建文章
hugo new posts/文章名.md

# 本地预览
hugo server -D

# 查看状态
git status

# 添加文件
git add content/posts/文章名.md

# 提交
git commit -m "Add new post: 文章名"

# 推送
git push
```

---

## 提示和技巧

1. **使用 Tab 键自动补全**
   - 输入部分路径后按 `Tab` 键自动补全

2. **使用上箭头键**
   - 按上箭头键可以重复之前的命令

3. **一次添加多个文件**
   ```bash
   git add content/posts/post1.md content/posts/post2.md
   ```

4. **查看 Git 历史**
   ```bash
   git log --oneline
   ```

5. **撤销更改（如果出错）**
   ```bash
   git restore content/posts/文章名.md
   ```

---

## 完成！

现在你已经知道如何发布博客了！🎉

记住流程：
1. 创建 → 2. 编辑 → 3. 预览（可选）→ 4. 提交 → 5. 推送 → 6. 等待部署

祝你写作愉快！


